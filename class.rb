class Song
  def initialize(name, artist, duration_seconds)
    @name = name
    @artist = artist
    @duration_seconds = duration_seconds
  end
end

bits_of_parrots = Song.new("Bits of Parrots", "Enemies", 244)

puts bits_of_parrots.inspect
