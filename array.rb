# arrays can have multiple types
multitype_array = [1, 'dog', "cat", 3.14, nil, true]
puts multitype_array

# first element
puts multitype_array[0]

# last element
puts multitype_array[multitype_array.length-1]

# circle the array and come back to the first element
puts multitype_array[multitype_array.length]

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
