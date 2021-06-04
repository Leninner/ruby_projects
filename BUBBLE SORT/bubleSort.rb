def bubble_sort(array)
    aux = array[0]
    for i in 0..array.length - 2 do
        for j in 0..array.length - 2 do
            if array[j] > array[j + 1]
                aux = array[j]
                array[j] = array[j + 1]
                array[j + 1] = aux
            end
        end
    end
    p array
end

bubble_sort([4,3,78,2,0,2])