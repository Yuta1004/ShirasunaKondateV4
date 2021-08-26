#!/usr/bin/env python

def func_edit_ngfile():
    pass


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
