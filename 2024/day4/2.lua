local function readFile(filename)
    local chars = {}
    for line in io.lines(filename) do
        local line_chars = {}
        for char in line:gmatch(".") do
            table.insert(line_chars, char)
        end
        table.insert(chars, line_chars)
    end
    return chars
end 

local function checkXMAS()
    local chars = readFile("input.txt")
    local total = 0
    for i, j in pairs(chars) do 
        for k, l in pairs(j) do 
            if l == "A" then
                if k > 1 and k < #j and i > 1 and i < #chars then
                    if chars[i-1][k-1] == "S" and chars[i-1][k+1] == "M"
                    and chars[i+1][k-1] == "S" and chars[i+1][k+1] == "M" then
                        total = total + 1
                    end
                    if chars[i-1][k-1] == "M" and chars[i-1][k+1] == "M"
                    and chars[i+1][k-1] == "S" and chars[i+1][k+1] == "S" then
                        total = total + 1
                    end
                    if chars[i-1][k-1] == "M" and chars[i-1][k+1] == "S"
                    and chars[i+1][k-1] == "M" and chars[i+1][k+1] == "S" then
                        total = total + 1
                    end
                    if chars[i-1][k-1] == "S" and chars[i-1][k+1] == "S"
                    and chars[i+1][k-1] == "M" and chars[i+1][k+1] == "M" then
                        total = total + 1
                    end
                end
            end
        end
    end
    return total
end

print(checkXMAS())
