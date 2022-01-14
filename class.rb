# there are no closed classes in ruby, including the built-in classes

class Song
  def initialize(name, artist, duration_seconds)
    @name = name
    @artist = artist
    @duration_seconds = duration_seconds
  end

  def to_s
    "Song: #@name--#@artist (#@duration_seconds seconds)"
  end
end

bits_of_parrots = Song.new("Bits of Parrots", "Enemies", 244)

puts bits_of_parrots.inspect # prints the id and all instance variables
puts bits_of_parrots.to_s # prints just the id if not overridden
