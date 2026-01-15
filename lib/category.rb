class Category
  def initialize(dir)
    @words_dir = dir
    @categories = []
  end

  def build_categories_list
    @words_dir.each do |file_path|
      @categories << { name: File.open(file_path, &:readline), path: file_path }
    end

    @categories
  end

  def select_category
    build_categories_list

    puts 'Select Category:'

    @categories.each_with_index do |c, i|
      puts "#{i + 1}. #{c[:name]}"
    end

    puts ''
    print '> '

    @categories[(gets.chomp.to_i - 1)]
  end
end
