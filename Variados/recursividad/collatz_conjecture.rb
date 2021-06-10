def collatz (n)
    #base case
    if n == 1
        return 0
    #odd numbers
    elsif n.odd? == true
        p 1 + collatz(3*n+1)
    #even numbers    
    elsif n.even? == true
        p 1 + collatz(n / 2)
    end
end

collatz(10)
p "hola"
collatz(2)
p "hola"
collatz(3)
p "hola"
collatz(4)