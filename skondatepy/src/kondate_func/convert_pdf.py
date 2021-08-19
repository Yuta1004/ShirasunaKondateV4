from pdfminer.pdfinterp import PDFPageInterpreter, PDFResourceManager
from pdfminer.converter import PDFPageAggregator
from pdfminer.layout import LAParams, LTTextBox, LTContainer
from pdfminer.pdfpage import PDFPage
import numpy as np
import re
import os

from kondate_func.check_type import is_float
from kondate_func.format import format_date


class KondateData:
    def __init__(self, date):
        self.date = date
        self.breakfast = []
        self.breakfast_nutritive = []
        self.lunch = []
        self.lunch_nutritive = []
        self.dinner = []
        self.dinner_nutritive = []

    def get_as_dict(self):
        return {
            "breakfast": {
                "date": self.date,
                "menu": self.breakfast,
                "nutritive": self.breakfast_nutritive
            },
            "lunch": {
                "date": self.date,
                "menu": self.lunch,
                "nutritive": self.lunch_nutritive
            },
            "dinner": {
                "date": self.date,
                "menu": self.dinner,
                "nutritive": self.dinner_nutritive
            }
        }


def find_all_textboxes(layout_obj):
    """
    PDFファイル内に含まれるTextBoxを返す

    ## Args
        - layout_obj : PDF解析結果として得られるオブジェクトのリスト

    ## Returns
        - textboxes : layout_objに含まれるTextBoxのリスト
    """
    textboxes = []
    if isinstance(layout_obj, LTTextBox):
        textboxes = [layout_obj]
    elif isinstance(layout_obj, LTContainer):
        for child in layout_obj:
            textboxes.extend(find_all_textboxes(child))
    return textboxes


def classfy_textboxes(textboxes):
    """
    PDFの解析の結果得られたTextBoxのリストを分類する

    ## Args
        - textboxes : PDFファイルに含まれていたTextBoxのリスト

    ## Returns
        - classfied_textboxes : 分類済みTextBoxのリスト
    """
    classfied_textboxes = [[], [], [], [], [], [], []]
    orig_classfied_textboxes = [[], [], [], [], [], [], []]
    ng_words = []
    with open("{}/ng_words.txt".format(os.environ.get("SK_SAVE_DIR", "/srv")), "r") as f:
        for line in f.read().split("\n"):
            if len(line) != 0:
                ng_words.append(line)

    # 基準となる座標を取得する
    # ファイルによって座標が異なるので特定のワードを含む文字列をヘッダー座標として取得する
    search_base_x = []
    for text_box in textboxes:
        if re.match(r".*月.*日\n", text_box.get_text()) and len(search_base_x) < 7:
            search_base_x.append(int((text_box.x0+text_box.x1)/2))

    # 特定文字列が存在しない場合は座標をセットする
    if len(search_base_x) == 0:
        search_base_x = [93, 206, 319, 432, 545, 657, 770]

    # 座標をもとにTextBoxを7つに分類する(日 月 ... 土)
    search_base_x = np.array(search_base_x)
    for text_box in textboxes:
        if abs(text_box.x1 - text_box.x0) >= 150:
            idx = np.abs(search_base_x - ((text_box.x0+text_box.x1)/2-50)).argmin()
        else:
            idx = np.abs(search_base_x - (text_box.x0+text_box.x1)/2).argmin()
        orig_classfied_textboxes[max(0, idx)].append(text_box)

    # NGワード除外
    for idx, item in enumerate(orig_classfied_textboxes):
        for text_box in item:
            text_box_value = text_box.get_text().replace("\n", "")
            if text_box_value not in ng_words:
                classfied_textboxes[idx].append(text_box_value)

    return classfied_textboxes


def get_week_kondate(year, classfied_textboxes):
    """
    分類済みTextBoxのリストから1週間分の献立情報を抽出する

    ## Args
        - year : 年
        - classfied_textboxes : 分類済みTextBoxのリスト

    ## Returns
        - week_kondate_data : 1週間分のKondateDataのリスト
    """
    week_kondate_data = []
    for value in classfied_textboxes:
        if len(value) != 0:
            week_kondate_data.append(KondateData(format_date(year, value[0])))

    for idx, value in enumerate(filter(lambda x: len(x) > 0, classfied_textboxes)):
        read_data = [[], [], [], [], [], [], [], [], [], []]
        now_read_type = 0  # 0, 2, 4 -> 朝食, 昼食, 夕食 : 1, 3, 5 -> それぞれの栄養値

        for item in value:
            # 読み込みデータの種類が変わった時
            if (is_float(item.split(" ")[0]) and now_read_type % 2 == 0) or (not is_float(item.split(" ")[0]) and now_read_type % 2 == 1):
                now_read_type += 1

            # 読み込みに失敗しているデータがあったら
            if len(item.split(" ")) >= 2 and idx < len(week_kondate_data)-1 and now_read_type % 2 == 0:
                if now_read_type == 0:
                    week_kondate_data[idx + 1].breakfast.append(item.split(" ")[1])
                elif now_read_type == 2:
                    week_kondate_data[idx + 1].lunch.append(item.split(" ")[1])
                else:
                    week_kondate_data[idx + 1].dinner.append(item.split(" ")[1])
                read_data[now_read_type].append(item.split(" ")[0])
                continue

            if now_read_type <= 5:
                read_data[now_read_type].append(item)

        week_kondate_data[idx].breakfast.extend(read_data[0][2:])
        week_kondate_data[idx].breakfast_nutritive.extend(read_data[1])
        week_kondate_data[idx].lunch.extend(read_data[2])
        week_kondate_data[idx].lunch_nutritive.extend(read_data[3])
        week_kondate_data[idx].dinner.extend(read_data[4])
        week_kondate_data[idx].dinner_nutritive.extend(read_data[5])

    return week_kondate_data


def get_kondate_from_pdf(dir_path, year, month):
    """
    PDFファイルを解析して献立情報を抽出する

    ## Args
        - dir_path : PDFファイルが配置されているディレクトリのパス
        - year : 年
        - month : 月

    ## Returns
        - kondate_data : 1ヶ月分(year/month)の献立情報
    """
    resource_manager = PDFResourceManager()
    layout_params = LAParams()
    layout_params.detect_vertical = True
    device = PDFPageAggregator(resource_manager, laparams=layout_params)

    pdf_file_path = "{}/{}_{}.pdf".format(dir_path, year, str(month).zfill(2))
    if not os.path.exists(pdf_file_path):
        raise FileNotFoundError("A pdf file \"{}_{}.pdf\" does not exist.".format(year, month))

    kondate_data_all = []
    with open(pdf_file_path, "rb") as f:
        interpreter = PDFPageInterpreter(resource_manager, device)
        for page in PDFPage.get_pages(f, maxpages=0, caching=True, check_extractable=True):
            interpreter.process_page(page)
            result = device.get_result()
            text_boxes = find_all_textboxes(result)
            text_boxes.sort(key=lambda b: (-b.y1, b.x0))
            parsed_data = classfy_textboxes(text_boxes)
            kondate_data = get_week_kondate(year, parsed_data)
            kondate_data_all.extend(kondate_data)

    device.close()
    return kondate_data_all
