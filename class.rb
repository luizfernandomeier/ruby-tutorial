# there are no closed classes in ruby, including the built-in classes
# an object's instance variables are private

class Song
  # shortcut for defining getter and setter methods
  attr_reader :artist, :duration_seconds
  attr_writer :artist, :duration_seconds

  # class variable (static attribute)
  @@plays = 0

  # constructor
  def initialize(name, artist, duration_seconds)
    @name = name
    @artist = artist
    @duration_seconds = duration_seconds
    @plays = 0
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

  def play
    @plays += 1
    @@plays += 1
  end

  def get_plays
    "The song #{@name} has been played #{@plays} times."
  end

  # class method (static method)
  def Song.get_total_plays
    "The total number of plays by any song is #{@@plays}."
  end

  # override to_s
  def to_s
    "Song: #@name--#@artist (#@duration_seconds seconds)"
  end
end

bits_of_parrots = Song.new("Bits of Parrots", "Enemiez", 244)
bits_of_parrots_radio_edit = Song.new("Bits of Parrots (Radio Edit)", "Enemies", 180)

puts bits_of_parrots.inspect # prints the id and all instance variables
puts bits_of_parrots.to_s # prints just the id if not overridden
puts bits_of_parrots.name # prints the attribute

bits_of_parrots.artist = "Enemies"
puts bits_of_parrots.artist

# setting virtual attribute
puts bits_of_parrots.duration_minutes # 4.066666666666666
bits_of_parrots.duration_minutes = 5.5
puts bits_of_parrots.duration_seconds # 330

2.times { bits_of_parrots.play }
4.times { bits_of_parrots_radio_edit.play }
puts bits_of_parrots.get_plays # 2
puts bits_of_parrots_radio_edit.get_plays # 4
puts Song.get_total_plays # 6

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

class SongList
  # class constant (static)
  MAX_TIME = 5 * 60

  # class method (static method)
  def SongList.is_too_long(song)
    song.duration_seconds > MAX_TIME
  end
end

puts SongList.is_too_long(Song.new('Stairway to Heaven', 'Led Zeppelin', 480)) # true
puts SongList.is_too_long(Song.new('Blitzkrieg Bop', 'Ramones', 120)) # false
