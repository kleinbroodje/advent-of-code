local function readFile(filename)
    local rules = {}
    local updates = {}
    local addRules = true
    for line in io.lines(filename) do
        if line == "" then
            addRules = false
        end
        if addRules then
            local rule = {}
            for i in line:gmatch("([^|]+)") do
                table.insert(rule, i)
            end
            table.insert(rules, rule)
        elseif line ~= "" then
            local update = {}
            for i in line:gmatch("([^,]+)") do
                table.insert(update, i)
            end
            table.insert(updates, update)
        end
    end
    return rules, updates
end

local function correctUpdates()
    local rules, updates = readFile("input.txt")
    local correctedUpdates = {}
    for i, update in pairs(updates) do
        local allNumsCorrect = false
        local alreadyCorrect = true
        local updateCopy = {}
        for k, v in pairs(update) do
            table.insert(updateCopy, v)
        end
        while not allNumsCorrect do
            for k, rule in pairs(rules) do
                local index1= nil
                local index2 = nil
                for l, num in pairs(updateCopy) do
                    if rule[1] == num then
                        index1 = l
                    end
                    if rule[2] == num then
                        index2 = l
                    end
                    if index1 and index2 then
                        if index1 > index2 then
                            local num1 = updateCopy[index1]
                            local num2 = updateCopy[index2]
                            updateCopy[index1] = num2
                            updateCopy[index2] = num1
                            alreadyCorrect = false
                            break
                        end
                    end
                end
            end
            allNumsCorrect = true
            for m, rule in pairs(rules) do
                local index1= nil
                local index2 = nil
                for n, num in pairs(updateCopy) do
                    if rule[1] == num then
                        index1 = n
                    end
                    if rule[2] == num then
                        index2 = n
                    end
                    if index1 and index2 then
                        if index1 > index2 then
                            allNumsCorrect = false
                            break
                        end
                    end
                end
            end
        end
        if not alreadyCorrect then
            table.insert(correctedUpdates, updateCopy)
        end
    end
    return correctedUpdates
end

local function getSum() 
    local total = 0
    for i, update in pairs(correctUpdates()) do
        total = total + tonumber(update[math.ceil(#update/2)]) 
    end
    return total
end

print(getSum())