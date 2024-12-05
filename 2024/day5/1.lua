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

local function checkUpdates ()
    local rules, updates = readFile("input.txt")
    local total = 0
    for i, update in pairs(updates) do
        local safe = true
        for j, rule in pairs(rules) do
            local index1= nil
            local index2 = nil
            for k, num in pairs(update) do
                if rule[1] == num then
                    index1 = k
                end
                if rule[2] == num then
                    index2 = k
                end
                if index1 and index2 then
                    if index1 > index2 then
                        safe = false
                        break
                    end
                end
            end
        end
        if safe then
            total = total + tonumber(update[math.ceil(#update/2)]) 
        end
    end
    return total
end

print(checkUpdates())