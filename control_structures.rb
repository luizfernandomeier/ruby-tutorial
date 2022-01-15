# classic if/else
if 1 > 2 or false
  puts "This won't be printed"
elsif 2 > 3
  puts "Neither will this"
else
  puts "But this will"
end

# if with statement modifier
puts "But this will - short version" if 2 > 1

# classic while loop
i = 0
while i < 100 and true
  i += 1
end
puts i

# while loop with statement modifier
i = 0
i += 1 while i < 100
puts i

# while loop checking for nil as false
def get_nil_if_zero(number)
  if number == 0
    return nil
  end
  return number
end

i = 10
while get_nil_if_zero(i)
  i -= 1
end
puts i

# each loop
animals = ['cat', 'dog']
animals.each {|animal| print(animal, " ")}

# times loop
5.times {|i| print(i, " ")}
puts

# uptop loop
5.upto(7) {|i| print(i, " ")}
puts

# sequence loop
('a'..'z').each {|letter| print(letter, " ")}
puts

 # unless calls the action only if unless condition is false
 puts 'unless test' unless false
 