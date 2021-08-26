#!/usr/bin/env python

import os
import glob


SK_SAVE_DIR = "/srv"
NGFILE = SK_SAVE_DIR+"/ng_words.txt"
PDF_DIR = SK_SAVE_DIR+"/pdf"
ask_ok = lambda: input("Are you sure? [y/N] > ") == "y"


def func_edit_ngfile():
    while True:
        print("\n1: Display ng words")
        print("2: Add a ng word")
        print("3: Remove a ng word")
        print("99: Exit this mode")

        command = input("[NG] > ")

        if command == "1":
            with open(NGFILE, "r") as f:
                for lnum, line in enumerate(f.readlines()):
                    print("  ({}) {}".format(lnum, line), end="")

        elif command == "2":
            while True:
                print("\n99: Exit this mode")
                new_ng_word = input("[NG/ADD] > ")
                if new_ng_word == "99" and ask_ok():
                    break
                if ask_ok():
                    with open(NGFILE, "a") as f:
                        f.write(new_ng_word+"\n")

        elif command == "3":
            remove_target_lines = []
            while True:
                print("\n99: Exit this mode")
                lnum, remove_lnum = (0, input("[NG/REMOVE] > "))
                if remove_lnum == "99" and ask_ok():
                    break
                try:
                    lnum = int(remove_lnum)
                except:
                    print("Input value \"{}\" is not valid number\n".format(lnum))
                    continue
                if ask_ok():
                    remove_target_lines.append(lnum)
            with open(NGFILE, "r+") as f:
                ng_words = f.readlines()
                f.seek(0)
                for num, ng_word in enumerate(ng_words):
                    if num not in remove_target_lines:
                        f.write(ng_word)
                f.truncate()

        elif command == "99" and ask_ok():
            return


def func_manage_pdffile():
    while True:
        print("\n1: Display saved pdf files")
        print("2: Remove a pdf file")
        print("99: Exit this mode")

        command = input("[PDF] > ")

        if command == "1":
            pdf_files_name = list(map(lambda f: f.split("/")[-1], glob.glob(PDF_DIR+"/*")))
            pdf_files_info = list(map(lambda n: (n.split("_")[0], n.split("_")[1].split(".")[0]), pdf_files_name))
            sorted_pdf_files_info = sorted(pdf_files_info, key=lambda info: int(info[0])*100+int(info[1]))
            now_displaying_year = ""
            for (year, month) in sorted_pdf_files_info:
                if now_displaying_year != year:
                    print("{}  ({}) ".format("" if now_displaying_year == "" else "\n", year), end="")
                    now_displaying_year = year
                print("{} ".format(month), end="")
            print("")

        elif command == "2":
            while True:
                print("\n99: Exit this mode")
                year_month = input("[PDF/REMOVE] > ")
                if year_month == "99" and ask_ok():
                    break
                year, month = year_month.split(" ")[0], year_month.split(" ")[-1]
                if year == month:
                    continue
                try:
                    _, _ = int(year), int(month)
                except:
                    continue
                if ask_ok():
                    os.remove("{}/{}_{}.pdf".format(PDF_DIR, year, month.zfill(2)))

        elif command == "99" and ask_ok():
            return


def func_exit():
    if ask_ok():
        exit(0)


if __name__ == "__main__":
    functions = {
        "1": func_edit_ngfile,
        "2": func_manage_pdffile,
        "99": func_exit
    }
    print("SKondatePY Setting Tool v1.0")
    while True:
        print("1: Edit a ng_words file")
        print("2: Manage kondate pdf files")
        print("99: Exit")
        command = input("> ")
        if functions.get(command) is None:
            print("Input \"{}\" is not valid command!".format(command))
        else:
            functions[command]()
        print()
