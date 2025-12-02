with open("input.txt", "r") as file:
    password = 0
    dial = 50
    lines = file.readlines()
    for line in lines:
        num = int(line[1:])
        if line.startswith("L"):
            for i in range(num):
                dial -= 1
                if dial < 0:
                    dial += 100
                if dial == 0:
                    password += 1

        elif line.startswith("R"):
            for i in range(num):
                dial += 1
                if dial > 99:
                    dial -= 100
                if dial == 0:
                    password += 1

    print(password)
