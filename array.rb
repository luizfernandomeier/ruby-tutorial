# arrays can have multiple types
multitype_array = [1, 'dog', "cat", 3.14, nil, true]
puts multitype_array.class # Array
puts multitype_array.length # 6
print multitype_array
puts

# first element
puts multitype_array[0] # 1

# last element
puts multitype_array[multitype_array.length-1] # true

# last element either (counting backwards)
puts multitype_array[-1] # true

# returns nil if index is out of bounds
puts multitype_array[multitype_array.length] # nil

# return a new array based on the interval [start, count]
print multitype_array[1, 3]
puts

# return a new array based on the range [start, end] - .. means including the end position
print multitype_array[1..3]
puts

# return a new array based on the range [start, end] - ... means excluding the end position
print multitype_array[1...3]
puts

# change the second element
multitype_array[1] = "doggo"
puts multitype_array[1]

# add an element
multitype_array << "new element"
puts multitype_array[multitype_array.length-1]

# array creation shortcut - just works with strings
shortcut_array = %w{one two three}
puts shortcut_array

# hash map (dictionary) - the last comma is optional
country_continent = {
  'Argentina' => 'South America',
  'Brazil' => 'South America',
  'Germany' => 'Europe',
  'Japan' => 'Asia',
}
puts country_continent
puts country_continent['Japan']

# if you define a hash map with two identical keys, the last one is considered
repeated_hash = {
  'a' => 'b',
  'a' => 'c',
  'b' => 'd',
}
puts repeated_hash
puts repeated_hash['b']

# searching for a non existent key just returns a nil value
puts repeated_hash['non_existent_key']

# create a new hash map with a default value of zero
default_hash = Hash.new(0)
puts default_hash['a'] # 0
default_hash['a'] = 1
puts default_hash['a'] # 1

# another ways of starting an array
array1 = Array.new
puts "#{array1.class}[#{array1.length}]"

array2 = []
puts "#{array2.class}[#{array2.length}]"

# assign array with gaps result in nil values
replaceable_array = [1,3,5,7,9]
replaceable_array[6] = 11
print replaceable_array # 1,3,5,7,9,nil,11
puts

# replacing two elements
replaceable_array[2,3] = 'dog' # [start, count]
print replaceable_array # 1,3,dog,nil,11
puts

# insert element
replaceable_array[3,0] = 'cat'
print replaceable_array # 1,3,dog,cat,nil,11
puts

# replace with a collection of elements
replaceable_array[3,1] = ['black cat', 'white cat']
print replaceable_array # 1, 3, dog, black cat, white cat, nil, 11
puts

# remove elements
replaceable_array[3,2] = []
print replaceable_array # 1, 3, dog, nil, 11
puts
