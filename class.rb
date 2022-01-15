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

  def initialize
    @songs = Array.new
  end

  def append(song)
    @songs.push(song)
    self # it is a convention to return self to allow chaining
  end

  def delete_first
    @songs.shift
    self
  end

  def delete_last
    @songs.pop
    self
  end

  # implements an array like method on the class
  def [](index)
    @songs[index]
  end

  # class method (static method)
  def SongList.is_too_long(song)
    song.duration_seconds > MAX_TIME
  end
end

puts SongList.is_too_long(Song.new('Stairway to Heaven', 'Led Zeppelin', 480)) # true
puts SongList.is_too_long(Song.new('Blitzkrieg Bop', 'Ramones', 120)) # false

# singleton class
# this implementation of singleton is not thread safe
class MyLogger
  # makes new method private so that only the singleton class can create a new instance
  private_class_method :new
  @@logger = nil
  def MyLogger.create
    @@logger = new unless @@logger # unless makes the new method be called only if unless condition is false
    @@logger
  end
end

puts MyLogger.create.object_id
puts MyLogger.create.object_id # prints the same id

# access levels
class SafeClass
  # initialize is always private
  def initialize
    @gold_amount = 0
  end

  # public method
  def public_method1
  end

  # all subsequent methods are protected
  protected
    def protected_method1
    end

    def protected_method2
    end
  
  # all subsequent methods are private
  private
    def private_method1
    end
  
  # all subsequent methods are public
  public
    def public_method2
    end

    def former_public_method3
    end

  # another way to change access levels
  private :former_public_method3 # private_class_method only applies to the class, not the instance

  attr_reader :gold_amount
  protected :gold_amount # protected accessor getter
  public def print_gold_amount(other_safe)
    # here we can acess another instance's protected attribute
    # this doesn't work on class methods
    puts "I have #{other_safe.gold_amount} gold coins."
  end

  public def add_gold(amount)
    @gold_amount += amount
  end
end

full_safe = SafeClass.new
full_safe.add_gold(100)
SafeClass.new.print_gold_amount(full_safe)
