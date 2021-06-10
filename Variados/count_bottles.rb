def count_bottles (n)
    if n != 0
        p "#{n} bottles en el piso"
        count_bottles(n - 1)
    else 
        p "Ya no queda nigun bottle" 
    end
end

count_bottles(15)