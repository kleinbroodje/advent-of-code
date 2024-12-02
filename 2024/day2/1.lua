function readFile(filename)
    local data = {}
    for line in io.lines(filename) do
        local report = {}
        for i in line:gmatch("%S+") do
            table.insert(report, i)
        end
        table.insert(data, report)
    end
    return data
end 

function getSafe()
    local safe_count = 0
    for i, j in pairs(readFile("input.txt")) do
        local safe = true
        local increasing = true 
        if j[1] - j[2] < 0 then
            increasing = false
        elseif j[1] - j[2] == 0 then
            safe = false
        end

        if safe then 
            for k=2, #j do
                if j[k-1] - j[k] < 0 and increasing then
                    safe = false
                    break
                end
                if j[k-1] - j[k] > 0 and not increasing then
                    safe = false
                    break
                end
                if j[k-1] - j[k] == 0  then
                    safe = false
                    break
                end
                if math.abs(j[k-1] - j[k]) > 3 then
                    safe = false
                    break
                end
            end
        end

        if safe then
            safe_count = safe_count + 1
        end
    end
    return safe_count
end

print(getSafe())