import os
import sys
import sqlite3

SK_SAVE_DIR = os.environ.get("SK_SAVE_DIR", "/srv")
PDF_DIR = "{}/pdf".format(SK_SAVE_DIR)
DB_DIR = "{}/db".format(SK_SAVE_DIR)


# 0. SK_SAVE_DIR存在チェック
if not os.path.exists(SK_SAVE_DIR):
    print("Dir \"{}\" does not exist.".format(SK_SAVE_DIR), file=sys.stderr)
    sys.exit(1)

# 1. PDF保存ディレクトリ
os.makedirs(PDF_DIR, exist_ok=True)

# 2. NGワードファイル
ng_words = [
    "栄養価 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) "
    "塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) "
    "塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g)",
    "栄養価 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g) 熱量(kcal) 蛋白質(E) 脂質(E) 炭水化物(E) 塩分(E) 熱量(kcaH) 蛋白質(H) 脂質(H) 炭水化物(H) "
    "塩分(H) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) "
    "塩分(g) 熱量(kcal) 蛋白質(g) 脂質(g) 炭水化物(g) 塩分(g)",
    "日 曜",
    "日",
    "朝食",
    "昼食",
    "夕食",
    "曜日",
    "朝 食",
    "昼 食",
    "夕 食",
    "西洋フード・コンパスグループ㈱",
    "　　※ 材料入荷などの都合により、献立が変更になる場合がありますので御了承下さい。",
    "⼤⾬による断⽔，⾷材の⼊荷困難な状況から，メニュー通りの⾷事は提供できません．おにぎりのみといったこともあり得ます．⾮常事態ですので，ご理解，ご協⼒をお願いします．",
    "・",
    "栄養価",
    "熱量(kcal)"
]
if not os.path.exists("{}/ng_words.txt".format(SK_SAVE_DIR)):
    with open("{}/ng_words.txt".format(SK_SAVE_DIR), "w") as f:
        for word in ng_words:
            f.write("{}\n".format(word))

# 3. DBファイル/ディレクトリ
os.makedirs(DB_DIR, exist_ok=True)
if not os.path.exists("{}/kondate.db".format(DB_DIR)):
    connect = sqlite3.connect("{}/kondate.db".format(DB_DIR))
    cur = connect.cursor()
    cur.execute("create table kondate (date interger, type interger, menu_list text not null, nutritive_list text not null, primary key(date, type));")
    cur.execute("create table type (type interger primary key, type_name char[10]);")
    cur.execute("insert into type values(1, \"breakfast\"), (2, \"lunch\"), (3, \"dinner\");")
    connect.commit()
    cur.close()
    connect.close()
