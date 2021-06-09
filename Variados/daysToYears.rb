class Insect
    def initialize(age_in_days)
        @age_in_days = age_in_days
    end
    
    def days_to_years () 
        @age_in_years = @age_in_days / 365
        puts "La edad en años es: #{@age_in_years} con #{@age_in_days % 365} días"
    end
end

lenin = Insect.new(1580)
lenin.days_to_years()
carlos = Insect.new(366)
carlos.days_to_years()