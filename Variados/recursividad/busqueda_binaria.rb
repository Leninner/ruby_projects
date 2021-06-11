#PARA CALCULAR EL NÚMERO DE VECES QUE PASOS QUE NECESITAMOS PARA ENCONTRAR UN ELEMENTO HACEMOS USO DE LA FÓRMULA: "Logaritmo en base
#2 de N => LOG2(N)"
## Para utilizar la búsqueda binaria del método "divide and conquer" necesitamos tener el arreglo ordenado

# PSEUDOCÓDIGO PARA REALIZAR UNA BÚSQUEDA BINARIA

    #  1. Repetir hasta que el subarreglo tenga un tamaño de 0
    ##    2. Calcular el punto media del arreglo o del subarreglo
    ##    3. Si lo que estamos buscando está en ese punto medio, entonces finalizamos la búsqueda
    ##    4. Caso contrario, si lo que buscamos es menor que el punto medio, entonces volvemos a llamar a la función con un nuevo subarray
            # Con un nuevo punto de final que debe ser el punto medio anterior
    ##    5. Caso contrario, si lo que buscamos es mayor al punto medio, entonces volvemos a llamar a la función con un nuevo subarray
            # Con un nuevo punto de inicio que debe ser el punto medio anterior

def binary_search(target, list)
    position = (list.count / 2).floor
    mid = list[position]

    return mid if mid == target

    #Si el número de la mitad es menor al target entonces llamamos de nuevo a la función con la posición aumentada en 1 y el número de elementos de la lista partido a 2
    #Caso contrario llamamos de nuevo a la función con el método slice desde 0 hasta la lista partida a la mitad.
    
    if(target > mid)
        return binary_search(target, list.slice(position + 1, list.count/2))
    else
        return binary_search(target, list.slice(0, list.count/2))
    end
end

puts binary_search(1, [1,2,3,4,5,6,7,8,10])
