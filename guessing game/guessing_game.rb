class GuessingGame
    def initialize(min, max)
        # @min = min
        # @max = max
        @game_over = false
        @num_attempts = 0
        @secret_num = rand(min..max)
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(number)
        @num_attempts += 1
        if number == @secret_num
            @game_over = true
            p 'you win'
        elsif number > @secret_num
            p 'too big'
        else
            p 'too small'
        end 
    end

    def ask_user
        p 'enter a number'
        guess = gets.chomp.to_i
        check_num(guess)
    end

end
