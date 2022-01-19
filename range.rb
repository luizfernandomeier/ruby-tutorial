# range is an object diferent than an array
# it contains only a reference to the first and last elements

# range loop
('a'..'z').each {|letter| print(letter, " ")}
puts

# range to array
print ('a'..'z').to_a
puts

# range contains
digits = 0..9
puts digits.class # Range
puts digits.include?(5) # true
puts digits.min # 0
puts digits.max # 9
print digits.reject {|i| i % 2 == 0} # 1,3,5,7,9 - retuns an array
puts

# range capable class
class VU
  attr :volume
  # mixin that includes the Comparable method like 'between'
  include Comparable

  def initialize(volume) # 0..9
    @volume = volume
  end

  def inspect
    "Volume: #{@volume}"
  end

  # support for ranges - both methods <=> and succ are necessary
  def <=> (other) # spaceship operator / comparison method
    self.volume <=> other.volume
  end

  # called for each item on the iteration
  def succ
     # just limits the range iteration, doesn't work with 'new'
    raise(IndexError, "Volume too high") if @volume >= 9
    VU.new(@volume.succ)
  end
end

vu = VU.new(100)
puts vu.inspect
print (VU.new(0)..VU.new(9)).to_a
puts

# error raised in succ - it only checks when the range is iterated
begin
  (VU.new(0)..VU.new(10)).to_a
rescue
  puts "Rescued error: #{$!}"
end

# between is a method of Comparable module
puts VU.new(2).between?(VU.new(1), VU.new(3)) # true
