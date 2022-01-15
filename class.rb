# there are no closed classes in ruby, including the built-in classes
# an object's instance variables are private

class Song
  # shortcut for defining getter and setter methods
  attr_reader :artist, :duration_seconds
  attr_writer :artist, :duration_seconds

  # constructor
  def initialize(name, artist, duration_seconds)
    @name = name
    @artist = artist
    @duration_seconds = duration_seconds
  end

  # since the instance variables are private, we define attributes (getter and setter methods)
  def name
    @name
  end

  # methods with the equal sign on the name are elegible to appear on the left side of an assignment
  def name=(new_name)
    @name = new_name
  end

  # virtual attribute
  def duration_minutes
    @duration_seconds / 60.0 # force floating point
  end

  def duration_minutes=(new_duration_minutes)
    @duration_seconds = (new_duration_minutes * 60).to_i
  end

  # override to_s
  def to_s
    "Song: #@name--#@artist (#@duration_seconds seconds)"
  end
end

bits_of_parrots = Song.new("Bits of Parrots", "Enemiez", 244)

puts bits_of_parrots.inspect # prints the id and all instance variables
puts bits_of_parrots.to_s # prints just the id if not overridden
puts bits_of_parrots.name # prints the attribute

bits_of_parrots.artist = "Enemies"
puts bits_of_parrots.artist

# setting virtual attribute
puts bits_of_parrots.duration_minutes # 4.066666666666666
bits_of_parrots.duration_minutes = 5.5
puts bits_of_parrots.duration_seconds # 330

# inheritance
class KaraokeSong < Song
  def initialize(name, artist, duration_seconds, lyrics)
    super(name, artist, duration_seconds)
    @lyrics = lyrics
  end

  def to_s
    "#{super} Lyrics: [#@lyrics]"
  end
end

bits_of_parrots_karaoke = KaraokeSong.new("Bits of Parrots", "Enemies", 244, "I'm a parrot, and I'm not a bird")
puts bits_of_parrots_karaoke.to_s