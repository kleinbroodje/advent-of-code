local function readFile(filename)
    local total = 0
    for line in io.lines(filename) do
        for z, a, b in line:gmatch("(mul%((%d+),(%d+)%))") do
            total = total + a*b
        end
    end
    return total
end 

print(readFile("input.txt"))