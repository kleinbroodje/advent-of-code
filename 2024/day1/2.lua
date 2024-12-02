function readFile(filename)
    local nums1 = {}
    local nums2 = {}

    for line in io.lines(filename) do
        local first = true
        for i in line:gmatch("%S+") do
            if first then
                table.insert(nums1, i)
                first = false
            else
                table.insert(nums2, i)
            end
        end
    end

    table.sort(nums1)
    table.sort(nums2)

    local data = {nums1, nums2}

    return data
end

function calculateSimilarity()
    local data = readFile("input.txt")
    local sum = 0
    for a, i in pairs(data[1]) do
        local n = 0
        for b, j in pairs(data[2]) do
            if i == j then
                n = n + 1
            end
        end
        sum = sum + n * i
    end
    return sum
end

print(calculateSimilarity())

