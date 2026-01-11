class Word
  def initialize(dir)
    @words_dir = dir
    @categories = []
    @words_list = []
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

    @categories.each_with_index do |c, i|
      puts "#{i + 1}. #{c}"
    end

    puts ''
    print '> '
    choice = gets.chomp.to_i

    selected_list = @words_list[(choice.to_i - 1)]
    @random_word_hint = selected_list.sample
  end

  def build_words_list
    @words_dir.each do |file_path|
      @categories << File.open(file_path, &:readline)

      File.open file_path do |f|
        @words_list << f.drop(1).map { |line| [line.split(',')[0], line.split(',')[1]] }
      end
    end
  end
end
