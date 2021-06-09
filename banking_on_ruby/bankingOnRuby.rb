class Account

    attr_reader :name, :balance

    def initialize (name, balance = 100)
        @name = name
        @balance = balance
    end

    private

    def pin
        @pin = 1234
    end

    private

    def pin_error
        return "Access denied: incorrect PIN."
    end

    public

    def display_balance (pin_number)
        if pin_number == pin
            puts "Balance: #{@balance}"
        else
            puts pin_error 
        end
    end

    public

    def withdraw (pin_number, amount)
        if amount < @balance
            if pin_number == pin
                @balance -= amount
                if @balance < 100 && @balance > 0
                    puts "Ten cuidado, estás cerca de sobregirar tu cuenta"
                    puts "Withdrew #{amount}. New balance: #{@balance}"
                else
                    puts "Withdrew #{amount}. New balance: #{@balance}"
                end
            else
                puts pin_error
            end
        else
            puts "No puedes sacar más dinero, porque no lo tienes"
        end
    end

    public

    def deposit (pin_number, amount)
        if pin_number == pin
            @balance += amount
            puts "El depósito fue de: #{amount}. Y tu nuevo balance es: #{@balance}"
        else
            puts pin_error
        end
    end
end

checking_account = Account.new("Lenin", 5000000)

checking_account.display_balance(1234)
checking_account.withdraw(1234, 9000)
checking_account.withdraw(1234, 900000)