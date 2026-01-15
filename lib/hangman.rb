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

        game_state.update_state(game_state.process_state(letter))

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
  end
end
