# frozen_string_literal: true

require './lib/hangman'
require './lib/game_state'
require './lib/word'

words_dir = Dir['./words/*']
word = Word.new(words_dir)

word.display_menu

puts ''
puts "Hint: #{word.hint}"
puts ''

start_state = GameState.new({
                              win: false,
                              lose: false,
                              playing: true,
                              word: word.word,
                              correct_letters: [],
                              incorrect_letters: [],
                              guess_count: 0,
                              max_guess_count: 10,
                              score: 0
                            })

Hangman.play(start_state)
