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

function calculateDistance()
    local data = readFile("input.txt")
    local sum = 0
    for i= 1, #data[1] do
        local d = math.abs(data[1][i] - data[2][i])
        sum = sum + d
    end
    return sum
end

print(calculateDistance())