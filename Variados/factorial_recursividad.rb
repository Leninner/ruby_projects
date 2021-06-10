#Empezamos declarando un método para parar a las llamadas del método dentro de sí
#Si el número llega a 1, solamente retornamos 1, caso contrario
#ponemos en la pantalla  n multiplicado a la llamada del método con n - 1 y lo transformamos a integer.

def fact(n)
    if n == 1
        return 1
    else
        p n * (fact(n-1)).to_i
    end
end

fact(5)