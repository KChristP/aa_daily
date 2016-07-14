require 'set'

class WordChainer

  attr_reader :all_seen_words
  def initialize(dict = 'dictionary.txt')
    @dict = File.readlines(dict).map(&:chomp).to_set
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {}
    @all_seen_words[source] = nil
    until @current_words.empty?
      curr_word = @current_words.shift
      new_current_words = adjacent_words(curr_word).
      reject { |word| @all_seen_words.keys.include?(word) }

      new_current_words.each { |word| @all_seen_words[word] = curr_word }
      new_current_words.each { |word| return word if word == target }
      @current_words.push(*new_current_words)
    end
    puts "word not found"
  end

  def back_trace(target)
    path = [target]

    until @all_seen_words[path.last].nil?
      path << @all_seen_words[path.last]
    end
    path
  end 

  def adjacent_words(curr_word)
    adjacents = []
    words = @dict.select { |w| w.length == curr_word.length }
    curr_word.chars.each_with_index do |letter, index|
      adjacents += words.select { |word| adjacent_helper(curr_word, word, index)}
    end

    adjacents.to_set
  end

  def adjacent_helper(word1, word2, idx)
    shrink_by_one(word1, idx) == shrink_by_one(word2, idx) && word1 != word2
  end

  def shrink_by_one(word, idx)
    characters = word.chars
    characters.delete_at(idx)
    characters.join
  end
end
