class Word
  def initialize(category)
    @category = category
  end

  def random_word_hint
    file_path = @category[:path]

    words_list = File.open file_path do |f|
      f.drop(1).map { |line| { word: line.split(',')[0], hint: line.split(',')[1] } }
    end

    words_list.sample
  end
end
