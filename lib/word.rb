class Word
  def initialize(dir)
    @words_list = []
    @words_dir = dir
    @random_word_hint = []
  end

  def word
    @random_word_hint[0]
  end

  def hint
    @random_word_hint[1]
  end

  def display_menu
    build_words_list

    puts 'Select Category:'

    @words_list.each_with_index do |m, i|
      puts "#{i + 1}. #{m[0]}"
    end

    puts ''
    print '> '
    choice = gets.chomp.to_i

    selected_list = @words_list[(choice.to_i - 1)]
    @random_word_hint = selected_list[1].sample
  end

  def build_words_list
    @words_dir.each do |file_path|
      submenu = []

      submenu << File.open(file_path, &:readline)

      File.open file_path do |f|
        submenu << f.drop(1).map { |line| [line.split(',')[0], line.split(',')[1]] }
      end

      @words_list << submenu
    end
  end
end
