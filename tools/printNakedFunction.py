def Func():
    path = "../asm/" + input(".s file in asm/: ")
    function = input("Function: ")

    file = open(path, "r")

    print("NAKED_FUNCTION\nvoid " + function + "(void) {\n    asm(\" \\n\\")

    line = file.readline()
    while line != '':
        if line.startswith(function + ':'):
            break
        line = file.readline()

    line = file.readline().strip('\r\n')
    while line != '':
        line = line.replace("	", "    ")
        line = line.replace("adds", "add")
        line = line.replace("subs", "sub")
        line = line.replace("muls", "mul")
        line = line.replace("lsls", "lsl")
        line = line.replace("lsrs", "lsr")
        line = line.replace("asrs", "asr")
        line = line.replace("ands", "and")
        line = line.replace("orrs", "orr")
        line = line.replace("eors", "eor")
        print(line+" \\n\\")
        line = file.readline().strip('\r\n')

    print("    \");\n}")

    file.close()

    Func()

Func()
