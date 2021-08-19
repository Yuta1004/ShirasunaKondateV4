#!/usr/bin/env python

import sqlite3
import datetime
from dateutil.relativedelta import relativedelta
import os
import sys

from kondate_func.format import list_to_plaintext
from kondate_func.convert_pdf import get_kondate_from_pdf
from kondate_func.download_kondate_pdf import download_kondate_pdf

SK_SAVE_DIR = os.environ.get("SK_SAVE_DIR", "/srv")
PDF_DIR = "{}/pdf".format(SK_SAVE_DIR)
DB_DIR = "{}/db".format(SK_SAVE_DIR)


def save_kondate_data_to_db(year, month):
    """
    指定年月の献立情報を取得しDBに書き込む

    ## Args
        - year : 年
        - month : 月
    """
    if not download_kondate_pdf(PDF_DIR, year, month):
        if not os.path.exists("{}/{}_{}.pdf".format(PDF_DIR, year, str(month).zfill(2))):
            raise ValueError("Cannot find a pdf file at shirasuna server. Please check \"year\" and \"date\".")
    kondate_all_data = get_kondate_from_pdf(PDF_DIR, year, month)

    connect = sqlite3.connect("{}/kondate.db".format(DB_DIR))
    cur = connect.cursor()
    for kondate in kondate_all_data:
        kondate = kondate.get_as_dict()
        for col_name in ["breakfast", "lunch", "dinner"]:
            date = kondate[col_name]["date"]
            menu = list_to_plaintext(kondate[col_name]["menu"], ";")
            nutritive = list_to_plaintext(kondate[col_name]["nutritive"], ";")
            cur.execute("""REPLACE INTO {} VALUES (?, ?, ?)""".format(col_name), (date, menu, nutritive))
            connect.commit()
    cur.close()
    connect.close()

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage : ./main.py <year> <month>", file=sys.stderr)
        sys.exit(1)

    (year, month) = (2015, 1)
    try:
       year = int(sys.argv[1])
       month = int(sys.argv[2])
    except:
        print("Arg values must be integer.", file=sys.stderr)
        sys.exit(1)

    try:
        save_kondate_data_to_db(year, month)
    except ValueError as e:
        print(e, file=sys.stderr)
        sys.exit(1)

    print("Kondate data({}/{}) is successfuly registered!".format(year, month))
