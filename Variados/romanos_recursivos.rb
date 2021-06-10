roman_mapping = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
}


# Tengo que recorrer por cada llave del hash para poder ir insertando los valores a nuestro parámetro result
# que tiene un valor por defecto vació
#Luego, podemos seguir llamando al método si el cociente sigue siendo mayor a 0

def integer_to_roman(roman_mapping, number, result = "")
    return result if number == 0
    roman_mapping.keys.each do |divisor|
        cociente, modulus = number.divmod(divisor)
        result << roman_mapping[divisor] * cociente
        return integer_to_roman(roman_mapping, modulus, result) if cociente > 0
    end
end

integer_to_roman(roman_mapping, 85)