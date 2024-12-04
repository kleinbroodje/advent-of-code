local function readFile(filename)
    local total = 0
    local do_ = true
    for line in io.lines(filename) do
        for i in line:gmatch("([%a']+%(%d-,-%d-%))") do
            if i:match("don't%(%)") then
                do_ = false
            end
            if i:match("do%(%)") then
                do_ = true
            end
            if do_ then
                for a, b in i:gmatch("mul%((%d+),(%d+)%)") do
                    total = total + a*b
                end
            end
        end
    end
    return total
end 

print(readFile("input.txt"))