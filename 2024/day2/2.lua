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
        for k=1, #j do
            local jcopy = {}
            for a, b in pairs(j) do
                jcopy[a] = b
            end
            table.remove(jcopy, k)

            local safe = true
            local increasing = true 
            if jcopy[1] - jcopy[2] < 0 then
                increasing = false
            elseif jcopy[1] - jcopy[2] == 0 then
                safe = false
            end

            if safe then 
                for l=2, #jcopy do
                    if jcopy[l-1] - jcopy[l] < 0 and increasing then
                        safe = false
                        break
                    end
                    if jcopy[l-1] - jcopy[l] > 0 and not increasing then
                        safe = false
                        break
                    end
                    if jcopy[l-1] - jcopy[l] == 0  then
                        safe = false
                        break
                    end
                    if math.abs(jcopy[l-1] - jcopy[l]) > 3 then
                        safe = false
                        break
                    end
                end
            end

            if safe then
                safe_count = safe_count + 1
                break
            end
        end    
    end
    return safe_count
end

print(getSafe())