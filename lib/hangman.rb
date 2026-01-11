class Hangman
  def initialize(word)
    @word = word
    @guess_count = 10
    @incorrect_guessed = []
    @guess_word = generate_guess_word(word)
    @score = 0
  end

  def play
    loop do
      puts prompt_message
      print '> '

      letter = gets.chomp[0]
      guess(letter)

      break if won? || lost?
    end

    puts prompt_message

    if won?
      puts 'You won!'
    else
      puts 'You lost!'
    end
  end

  def prompt_message
    message = [
      "#{@guess_word} score   #{@score}",
      "remaining incorrect guess #{@guess_count}"
    ]

    message << "incorrect guessed: #{@incorrect_guessed.join(',')}" unless @incorrect_guessed.empty?

    message.join(', ')
  end

  def won?
    @word == @guess_word
  end

  def lost?
    @guess_count.zero?
  end

  def guess(letter)
    if @incorrect_guessed.include?(letter)
      puts 'already guessed'
    else
      indices = find_letter_indices_in_word(letter)

      if indices.empty?
        @incorrect_guessed << letter
        @guess_count -= 1
      else
        update_guess_word(indices)
        update_score(indices)
      end
    end
  end

  def update_guess_word(indices)
    indices.each do |i|
      @guess_word[i] = @word[i]
    end
  end

  def find_letter_indices_in_word(letter)
    @word.chars.each.with_index.select { |c, _| c.to_s.downcase == letter.to_s.downcase }.map(&:last)
  end

  def update_score(indices)
    @score += indices.size
  end

  def generate_guess_word(word)
    word.to_s.gsub(/[A-Za-z]/, '_')
  end
end
