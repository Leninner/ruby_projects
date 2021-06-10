def count_bottles (n)
    if n != 0
        count_bottles(n - 1)
        p "#{n} bottles en el piso"
    else 
        p "Ya no queda nigun bottle" 
    end
end

count_bottles(15)