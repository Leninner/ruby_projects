module MathHelper
    def result (number)
        puts number * 2
    end
end

class Homework
    include MathHelper
end

one = Homework.new()
one.result(20)
one.result(90)
one.result(1356)
one.result(45.96)