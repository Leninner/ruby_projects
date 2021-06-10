	
#Voy ingresando a cada elemento del arreglo y compruebo si una elemento es de clase "arreglo"
#Si es que es una arreglo, llamo otra vez al método y sigo comprobando 
#Cuando deje de ser un arreglo, entonces añado los elementos al arreglo "result"
#Finalmente, imprimo en pantalla el arreglo "result"

def flatten(array, result = [])
    array.each do |element|
        if element.kind_of?(Array)
            flatten(element, result)
        else
            result << element
        end
    end 
    p result
end

flatten([[[1, 2, 3], [4, 5, 6]], [7, 8, 9]])