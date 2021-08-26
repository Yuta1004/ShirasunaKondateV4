#!/usr/bin/env python

SK_SAVE_DIR = "/srv"
NGFILE = SK_SAVE_DIR+"/ng_words.txt"
PDF_DIR = SK_SAVE_DIR+"/pdf"


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
                if new_ng_word == "99" and input("Exit this mode [y/N] > ") == "y":
                    break
                if input("Add this word \"{}\" [y/N] > ".format(new_ng_word)) == "y":
                    with open(NGFILE, "a") as f:
                        f.write(new_ng_word+"\n")

        elif command == "3":
            remove_target_lines = []
            while True:
                print("\n99: Exit this mode")
                lnum, remove_lnum = (0, input("[NG/REMOVE] > "))
                if remove_lnum == "99" and input("Exit this mode [y/N] > ") == "y":
                    break
                try:
                    lnum = int(remove_lnum)
                except:
                    print("Input value \"{}\" is not valid number\n".format(lnum))
                    continue
                if input("Remove line {} [y/N] > ".format(lnum))== "y":
                    remove_target_lines.append(lnum)
            with open(NGFILE, "r+") as f:
                ng_words = f.readlines()
                f.seek(0)
                for num, ng_word in enumerate(ng_words):
                    if num not in remove_target_lines:
                        f.write(ng_word)
                f.truncate()

        elif command == "99" and input("Exit this mode [y/N] > ") == "y":
            return


def func_manage_pdffile():
    pass


def func_exit():
    if input("Exit this tool [y/N] > ") == "y":
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
