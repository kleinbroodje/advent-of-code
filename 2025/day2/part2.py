with open("input.txt", "r") as file:
    line = file.readline()
    ranges = line.split(",")
    ids = []
    total = 0
    for range_ in ranges:
        values = range_.split("-")
        for i in range(int(values[0]), int(values[1]) + 1):
            j = str(i)
            if j[0] == "0":
                continue
            for k in range(1, int(len(j) / 2) + 1):
                if len(j) % k == 0:
                    invalid_id = ""
                    for m in range(int(len(j) / k)):
                        invalid_id += j[:k]
                    if invalid_id == j:
                        total += i
                        break
    print(total)
