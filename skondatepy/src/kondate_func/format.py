from datetime import datetime

def format_date(year, month_and_day_str):
    month = month_and_day_str.split("月")[0].zfill(2)
    day = month_and_day_str.split("月")[1].replace("日", "").zfill(2)

    return str(year) + month + day


def list_to_plaintext(arg_list, splitter=";"):
    plaintext = ""
    for item in arg_list:
        plaintext += item + splitter

    return plaintext


def plaintext_to_list(plaintext, splitter=";"):
    ret_list = []
    for item in plaintext.split(splitter):
        ret_list.append(item)

    return ret_list[:-1]
