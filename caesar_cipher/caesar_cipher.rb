# def caesar_cipher (string, key)
#     array1 = string.chars.map{|x| x.ord}
#         letter_check = array1.map{|number| (number >= 97 && number <= 122) || (number >= 65 && number <= 90)? number : number.chr}
#         wrap_array = letter_check.map{ |number| number.is_a?(Numeric) ? number + key : number}
#         final_array = wrap_array.map { |number| number.is_a?(Numeric) && number > 122 || (number.is_a?(Numeric) && number > 90 && number <97) ? number - 26 : number}
#     p x = final_array.map{ |c| c.chr}.join('')
# end

#NOTE: El código ASCII empieza en 97 con "a" y termina con 122 con "z". En MINÚSCULAS
# a = 97 
# b = 98
# c = 99
# x = 120
# y = 121
# z = 122

#NOTE: El código ASCII empieza en 65 con "A" y termina con 90 en "Z". En MAYÚSCULAS
# A = 65
# B = 66
# C = 67
# X = 88
# Y = 89
# Z = 90

#NOTE: El método #chr al pasarle un número, devuelve ese número antes del código ascii. 
#Si se le pasa un string, devuelve ese mismo string. 
#Trabaja de manera inversa a "ORD"
# 97.chr = 9
# "a".chr = "a"

#NOTE: El método #ORD sirve para pasarle una letra y que nos devuelva su equivalente
# en el código ascii, si se le pasa un número, devuelve ese mismo número
# "A".ord = 65
# 65.ord = 65

def caesar_cipher (string, key) 
    array1 =  string.chars.map do |letra| #chars devuelve cada elemento uno a uno del string
        letra.ord #Devuelve la posición ordinnal de la letra. El código ascii
    end
    comprobar_letras = array1.map do |number|
        (number >= 97 && number <= 122) || (number >= 65 && number <= 90)? number : number.chr 
    end
    array_anidado = comprobar_letras.map do |number|
        number.is_a?(Numeric) ? number + key : number #is_a? => Devuelve verdadero si class es 
        # la clase de obj, o si class es una de las superclases de obj o módulos incluidos en obj.
    end
    final_array = array_anidado.map do |number|
        #is_a sirve para combrobar la clase o el tipo de algún elemento
        (number.is_a?(Numeric) && number > 122) || (number.is_a?(Numeric) && number > 90 && number < 97) ? (number - 26).chr : number.chr
    end.join("")
    p final_array
end

caesar_cipher("What a string!", 5)
caesar_cipher("La luna es de queso!", 10)
caesar_cipher("Mathias y su libro de 'Lugares Asombrosos'!", 3)
# "Bmfy f xywnsl!"