def sign(value):
    if value > 0x7FFF:
        value = -(0x10000 - value)

    if value == 0x7FFF:
        value = "SHORT_MAX"

    return value

file = open("../mf_us_baserom.gba", "rb")

def Func():
    inputValue = input("Address : ")
    size = int(input("Size : "))

    addr = int(inputValue, 16)

    file.seek(addr)

    result = ""

    for x in range(1, size + 1):
        result += str(sign(int.from_bytes(file.read(2), "little")))
        # result += hex(int.from_bytes(file.read(2), "little"))

        if x < size:
            if x % 4 == 0 and x != 0:
                result += ",\n"
            else:
                result += ", "

    print(result)
    Func()

Func()
