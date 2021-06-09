class BaseballPlayer
    def initialize (hits, walks, at_bats)
        @hits = hits
        @walks = walks
        @at_bats = at_bats
    end

    def batting_average 
        puts @hits.to_f / @at_bats
    end

    def on_base_percentage
        puts (@hits + @walks).to_f / @at_bats
    end
end

rocky = BaseballPlayer.new(60, 30, 24)

rocky.batting_average
rocky.on_base_percentage