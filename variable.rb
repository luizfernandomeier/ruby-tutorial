# false / true - any value that is not nil or false is true - 0 is true

# variable names must use lowercase letters and underscores (snake_case)
$global_name = "Luiz"
@instance_name = "Fernando"
local_name = "Meier"

# constants must start with a capital letter and use CamelCase
ConstantName = "this value can't be changed"

# check if a variable is defined
puts defined?(non_existing_variable) == nil

# parallel assignment
parallel1, parallel2 = 1, 2
puts "#{parallel1} - #{parallel2}"

# in ruby, nil is an actual object
nil_a = nil
nil_b = nil
puts nil_a == nil_b # true

# test for nil
puts nil_a.nil? # true

# variable references
person1 = "Tim"
person2 = person1 # just copies the reference
puts "person1: #{person1}, person2: #{person2}"

person1[0] = "J"
puts "person1: #{person1}, person2: #{person2}"

person2 = "John"
puts "person1: #{person1}, person2: #{person2}"

person2 = person1.dup # duplicates the object with a different reference
puts "person1: #{person1}, person2: #{person2}"

person1[0] = "T"
puts "person1: #{person1}, person2: #{person2}"

person2 = person1
puts "person1: #{person1}, person2: #{person2}"

person1.freeze
begin
  person1[0] = "J"
rescue
  puts "Can't modify frozen string"
end
begin
  person2[0] = "J"
rescue
  puts "Can't modify frozen string"
end

# TODO test object type
# def string?(object)
#   object::String
# end
# puts string?("Hello") # true

# the right side is evaluated first, so this change is possible
a, b = 1, 2
puts "a: #{a}, b: #{b}"
a, b = b, a
puts "a: #{a}, b: #{b}"

# comparison operators
puts 1 == 1.0 # true
puts 1.eql?(1.0) # false - different types

class IdTest
  attr_reader :id
  def initialize(id)
    @id = id
  end
  def ==(other)
    @id == other.id
  end
end
a = IdTest.new(1)
b = IdTest.new(1)
puts a == b # true
puts a.eql?(b) # false - same type # TODO when is this true?
puts a.equal?(b) # false - different id's

# nvl, isnull, ifnull
a = 1
a ||= 2 # same as a = a || 2
puts a # 1

b = nil
b ||= 2
puts b # 2

# append <<
puts "Hello" << " " << "World" # Hello World
print [] << 1 << 2 << 3 # [1, 2, 3]
puts

# bitwise operators << >>
puts 2 << 3 # 16 - left shift - 00010 -> 10000
puts 16 >> 2 # 4 - right shift - 10000 -> 00100
