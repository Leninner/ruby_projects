def bubble_sort(array)
    aux = array[0]
    #Utilizamos 2 bucles para recorrer por todo el arreglo, y comparar si la posición actual es mayor a la siguiente
    #si esa condición es verdadera, entonces podemos intercambiar posiciones haciendo uso de una varibale auxiliar
    #para no alterar el arreglo
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