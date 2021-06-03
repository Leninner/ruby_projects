def substrings (string, dictionary)
    coincidencia = {}
    dictionary.select do |palabra|
        coincidencia[palabra] = string.downcase.scan(/(?=#{palabra})/).count if string.downcase.include?(palabra)
        #SCAN Sirve para buscar cualquier coincidencia de la palabra de un string
        #COUNT Sirve en este caso para retornar el número de veces de coincidencia
    end
    p coincidencia
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
# { "below" => 1, "low" => 1 }
# {"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}