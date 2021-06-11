def binary_search(target, list)
    position = (list.count / 2).floor
    mid = list[position]

    return mid if mid == target

    if(mid < target)
        return binary_search(target, list.slice(position + 1, list.count/2))
    else
        return binary_search(target, list.slice(0, list.count/2))
    end
end

puts binary_search(9, [1,2,3,4,5,6,7,8,9,10])