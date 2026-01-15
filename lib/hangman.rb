# frozen_string_literal: true

module Hangman
  class << self
    # Main loop
    def play(game_state)
      loop do
        puts game_state.prompt_message

        print '> '

        letter = gets.chomp[0]

        puts 'already guessed' if game_state.already_guess?(letter)

        process_state(game_state, letter)

        break if game_state.win? || game_state.lose?
      end

      puts game_state.prompt_message

      if game_state.win?
        puts 'You won!'
      else
        puts 'You lost!'
      end

      game_state
    end

    def process_state(game_state, letter)
      return game_state if letter.nil?

      letter = letter.downcase

      return game_state unless letter.match?(/[A-Za-z]/)

      return game_state if game_state.win? || game_state.lose?

      return game_state unless game_state.playing?

      return game_state if game_state.already_guess?(letter)

      if game_state.check_letter_in_word?(letter)
        game_state.handle_correct(letter)
      else
        game_state.handle_incorrect(letter)
      end

      game_state
    end
  end
end
