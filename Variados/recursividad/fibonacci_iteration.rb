def fibonacci_iteration  (n)
    a = 0
    b = 1
    numbers = [a, b]
    fib = 0
    (n-2).times do
        fib = a + b
        numbers << fib
        a = b
        b = fib
    end
    p numbers
    p numbers.length
end

fibonacci_iteration(5)
fibonacci_iteration(10)