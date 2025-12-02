local function readFile(filename)
    local map = {}
    local addRules = true
    for line in io.lines(filename) do
        local row = {}
        for i in line:gmatch(".") do
            table.insert(row, i)
        end
        table.insert(map, row)
    end
    return map
end

local function checkRoute()
    local map = readFile("input.txt")
    local visitedLoc = {}
    local directions =  {{1, 0}, {0, 1}, {-1, 0}, {0, -1}}
    local playerD = 4
    local playerLoc = {}
    for y, i in pairs(map) do
        for x, j in pairs(i) do
            if j == "^" then 
                playerLoc = {x, y}
                table.insert(visitedLoc, {x, y})
            end
        end
    end
    while true do 
        if playerLoc[1] + directions[playerD][1] < 1 
        or playerLoc[1] + directions[playerD][1] > #map[1] 
        or playerLoc[2] + directions[playerD][2] < 1 
        or playerLoc[2] + directions[playerD][2] > #map then
            break
        end
        if map[playerLoc[2]+directions[playerD][2]][playerLoc[1]+directions[playerD][1]] == "#" then
            if playerD < 4 then
                playerD = playerD + 1
            else 
                playerD = 1
            end
        end
        playerLoc[1] = playerLoc[1] + directions[playerD][1]
        playerLoc[2] = playerLoc[2] + directions[playerD][2]
        local visited = false
        for k, l in pairs(visitedLoc) do
            if l[1] == playerLoc[1] and l[2] == playerLoc[2] then
                visited = true
            end 
        end
        if not visited then
            table.insert(visitedLoc, {playerLoc[1], playerLoc[2]})
        end
    end
    return #visitedLoc
end

print(checkRoute())