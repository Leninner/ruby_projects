def stock_picker (numbers)
    profits = {}
    #Hacemos dos recorridos para ir controlando la posición
    #Si el indice de la segunda vuelta es mayor al indice de la primera entonces podemos restar el valor de la segunda 
    #vuelta, menos el primero
    numbers.each_with_index do |valor1, indice1|
        numbers.each_with_index do |valor2, indice2|
            if indice2 > indice1
                profits[[indice1, indice2]] = valor2 - valor1
            end
        end
    end

    #Ordenamos por valor y luego tomamos el último elemento del hash y lo imprimimos

    profits = profits.sort_by {|k, v| v}

    max_profit = profits[-1]

    p max_profit
    puts "Buy on day #{max_profit[0][0]} and sell on day #{max_profit[0][1]} for the maximum profit of #{max_profit[1]}$"
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
stock_picker([78, 1, 9, 5, 12, 54, 56, 456, 45, 45, 1, 900])
# [1,4]  # for a profit of $15 - $3 == $12