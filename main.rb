require './lib/hangman'
require './lib/word'

words_dir = Dir['./words/*']
word = Word.new(words_dir)

word.display_menu

puts ''
puts "Hint: #{word.hint}"

hangman = Hangman.new(word.word)

hangman.play
