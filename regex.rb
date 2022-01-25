text = "ba123b456"
regex = /[1-9]+/

# in ruby, even the regex is an object
puts /[1-9]+/.match(text) # 123

# print all matches - it works differently if the regex has groups
print text.scan(regex)
puts

# if a group is specified, it gets only that content
puts "<title>Google</title>".scan(/<title>(.*)<\/title>/) # Google
puts "<title>Google</title>".scan(/<title>.*<\/title>/) # <title>Google</title>

# special regex match operator
if text =~ regex
  puts "match: #{text}"
  puts "match position: #{text =~ regex}"
  puts "preceding match text: #{$`}"
  puts "match text: #{$&}"
  puts "after the match text: #{$'}"
  puts "match decorated: #{$`}<<#{$&}>>#{$'}"
  puts "match data object: #{$~.class}"
end

# negative match
if text !~ /7-9/
  puts "didn't match"
end

puts "match: #{text}" if text =~ regex

# replace first substring matched by regex
puts text.sub(regex, 'NEW TEXT')

# replace all substrings matched by regex
puts text.gsub(regex, 'NEW TEXT')

# this function can use blocks
puts "Luiz Fernando".sub(/\w+/) { |match| match.upcase } # LUIZ Fernando

# group variables
puts /\d\d[:]\d\d/.match("12:50")
puts "Hour: #{$1}, Minutes: #{$2}" # Hour: , Minutes: 
puts /(\d\d)[:](\d\d)/.match("12:50")
puts "Hour: #{$1}, Minutes: #{$2}" # Hour: 12, Minutes: 50
puts /((\d\d)[:](\d\d))/.match("12:50")
puts "Time: #{$1}, Hour: #{$2}, Minutes: #{$3}" # Time: 12:50, Hour: 12, Minutes: 50
