import os
import urllib.request
import urllib.error


def download_kondate_pdf(path, year, month):
    """
    白砂寮サーバから献立情報PDFをダウンロードする

    ## Args
        - path : PDFファイルを保存するパス
        - year : 年
        - month : 月

    ## Returns
        - result : ダウンロードに成功した場合はTrue，そうでないときFalse
    """
    url = "http://shirasunaryou.sakura.ne.jp/cgi-bin/shirasuna/kondate/{}/{}.pdf".format(year, str(month).zfill(2))
    download_path = "{}/{}_{}.pdf".format(path, year, str(month).zfill(2))
    try:
        urllib.request.urlretrieve(url, download_path)
    except urllib.error.HTTPError:
        return False
    return True
