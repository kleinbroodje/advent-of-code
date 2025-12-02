with open("input.txt", "r") as file:
    line = file.readline()
    ranges = line.split(",")
    ids = []
    total = 0
    for range_ in ranges:
        values = range_.split("-")
        for i in range(int(values[0]), int(values[1]) + 1):
            j = str(i)
            if len(j) % 2 != 0 or j[0] == "0":
                continue
            if j[: int(len(j) / 2)] == j[int(len(j) / 2) : len(j)]:
                total += i
    print(total)
