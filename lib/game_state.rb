class GameState
  def initialize(state)
    @state = state
  end

  def win?
    @state[:win] == true
  end

  def lose?
    @state[:lose] == true
  end

  def playing?
    @state[:playing] == true
  end

  def already_guess?(letter)
    @state[:incorrect_letters].map(&:downcase).uniq.include?(letter) ||
      @state[:correct_letters].map(&:downcase).uniq.include?(letter)
  end

  def check_letter_in_word?(letter)
    @state[:word].downcase.gsub(/[^A-Za-z]/, '').include?(letter.downcase)
  end

  def handle_correct(letter)
    @state[:correct_letters] << letter unless @state[:correct_letters].map(&:downcase).uniq.include?(letter)

    @state[:score] += 1
    @state[:win] = check_win(@state)
  end

  def check_win(state)
    state[:word].downcase.gsub(/[^A-Za-z]/,
                               '').chars.uniq.size == state[:correct_letters].map(&:downcase).uniq.size
  end

  def handle_incorrect(letter)
    return @state if @state[:incorrect_letters].map(&:downcase).uniq.include?(letter)

    @state[:incorrect_letters] << letter
    @state[:guess_count] += 1
    @state[:lose] = check_lose(@state)
  end

  def check_lose(state)
    state[:guess_count] >= state[:max_guess_count]
  end

  def prompt_message
    message = [
      "#{guess_word(@state[:word], @state[:correct_letters])}   score   #{@state[:score]}",
      "remaining incorrect guess #{@state[:max_guess_count].to_i - @state[:guess_count].to_i}"
    ]

    message << "incorrect guessed: #{@state[:incorrect_letters].join(',')}" unless @state[:incorrect_letters].empty?

    message.join(', ')
  end

  def guess_word(word, correct_letters)
    replacement_char = '_'

    word.chars.map do |char|
      if char.match?(/[A-Za-z]/)
        correct_letters.map(&:downcase).uniq.include?(char.downcase) ? char : replacement_char
      else
        char
      end
    end.join
  end
end
