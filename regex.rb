text = "a123b456"
regex = /[1-9]+/

# in ruby, even the regex is an object
puts /[1-9]+/.match(text) # 123

# print all matches - it works differently if the regex has groups
puts text.scan(regex)

# special regex match operator
if text =~ regex
  puts "match: #{text}"
end

puts "match: #{text}" if text =~ regex

# replace first substring matched by regex
puts text.sub(regex, 'NEW TEXT')

# replace all substrings matched by regex
puts text.gsub(regex, 'NEW TEXT')
