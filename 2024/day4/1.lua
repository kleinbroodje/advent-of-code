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
            if l == "X" then
                if k > 3 then
                    if j[k-1] == "M" and j[k-2] == "A" and j[k-3] == "S" then
                        total = total + 1
                    end
                end
                if k < #j-2 then
                    if j[k+1] == "M" and j[k+2] == "A" and j[k+3] == "S" then
                        total = total + 1
                    end
                end
                if i > 3 then
                    if chars[i-1][k] == "M" and chars[i-2][k] == "A" and chars[i-3][k] == "S" then
                        total = total + 1
                    end
                end
                if i < #chars-2 then
                    if chars[i+1][k] == "M" and chars[i+2][k] == "A" and chars[i+3][k] == "S" then
                        total = total + 1
                    end
                end
                if k > 3 and i < #chars-2 then
                    if chars[i+1][k-1] == "M" and chars[i+2][k-2] == "A" and chars[i+3][k-3] == "S" then
                        total = total + 1
                    end
                end
                if k < #j-2 and i < #chars-2 then
                    if chars[i+1][k+1] == "M" and chars[i+2][k+2] == "A" and chars[i+3][k+3] == "S" then
                        total = total + 1
                    end
                end
                if i > 3 and k > 3 then
                    if  chars[i-1][k-1] == "M" and chars[i-2][k-2] == "A" and chars[i-3][k-3] == "S" then
                        total = total + 1
                    end
                end
                if  i > 3 and k < #j-2 then
                    if chars[i-1][k+1] == "M" and chars[i-2][k+2] == "A" and chars[i-3][k+3] == "S" then
                        total = total + 1
                    end
                end
            end
        end
    end
    return total
end

print(checkXMAS())
