require "./class.rb"

class WordIndex
  def initialize
    @index = {}
  end

  def add_to_index(obj, *phrases)
    phrases.each do |phrase|
      phrase.scan(/\w[-\w']+/) do |word|
        word.downcase!
        @index[word] = [] if @index[word].nil?
        @index[word].push(obj)
      end
    end
  end

  def fixed_add_to_index(obj, *phrases)
    phrases.each do |phrase|
      phrase.scan(/\w[-\w']+/) do |word|
        word.downcase!
        @index[word] = [] if @index[word].nil?
        @index[word].push(obj) if @index[word].index(obj).nil?
      end
    end
  end

  def lookup(word)
    @index[word.downcase]
  end
end

index = WordIndex.new
index.add_to_index(Song.new("Gone, Gone, Gone", "Led Zeppelin", 240), "Gone, Gone, Gone")
puts index.lookup("gone")

fixed_index = WordIndex.new
fixed_index.fixed_add_to_index(Song.new("Gone, Gone, Gone 2", "Led Zeppelin", 240), "Gone, Gone, Gone")
puts fixed_index.lookup("gone")
