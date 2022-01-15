# hash map (dictionary) - the last comma is optional
country_continent = {
  'Argentina' => 'South America',
  'Brazil' => 'South America',
  'Germany' => 'Europe',
  'Japan' => 'Asia',
}
puts country_continent
puts country_continent.length # 4
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
