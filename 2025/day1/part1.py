with open("input.txt", "r") as file:
    password = 0
    dial = 50
    lines = file.readlines()
    for line in lines:
        num = int(line[1:])
        if line.startswith("L"):
            dial -= num
        elif line.startswith("R"):
            dial += num
        dial %= 100
        if dial == 0:
            password += 1
    print(password)
