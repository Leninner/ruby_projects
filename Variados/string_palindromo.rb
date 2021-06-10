def palindrome(string)
    if string.length == 1 || string.length == 0
        p true
    else
        if string[0] == string[-1]
            palindrome(string[1..-2])
        else
            p false
        end
    end
end

palindrome("ole")
palindrome("hello")
palindrome("cArAc")
palindrome("oloolooloolo")