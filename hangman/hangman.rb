class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :remaining_incorrect_guesses, :attempted_chars
  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    ans = []
    @secret_word.each_char.with_index do |ele, i|
      ans.push(i) if ele == char
    end
    ans
  end

  def fill_indices(char, arr)
    arr.each {|i| @guess_word[i] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    end

    @attempted_chars << char 

    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)
    @remaining_incorrect_guesses -= 1 if matches.empty?
    true
  end

  def ask_user_for_guess
    p 'Enter a char:' 
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses > 0
      false
    else
      p 'LOSE'
      true
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      true
    else
      false
    end
  end

end
