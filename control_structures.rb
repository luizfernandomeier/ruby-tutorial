# classic if/else
if 1 > 2 or false
  puts "This won't be printed"
elsif 2 > 3
  puts "Neither will this"
else
  puts "But this will"
end

# in one line needs the then or ":" keyword
if 1 > 2 then puts "This won't be printed"
else puts "But this will"
end

## if 1 > 2: puts "This won't be printed" # TODO: this was supposed to work? page 119
## else puts "But this will"
## end

# if with statement modifier
puts "But this will - short version" if 2 > 1

# negated if
unless 1 > 2 then puts "This will be printed"
end

# shorter negated if
puts "This will be printed" unless 1 > 2

# ternary operator
puts 1 > 2 ? "1 is greater than 2" : "1 is not greater than 2"

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

# until loop

i = 0
until i == 10
  print "#{i} "
  i += 1
end
puts

# each loop
animals = ['cat', 'dog']
animals.each {|animal| print(animal, " ")}

# times loop
5.times {|i| print(i, " ")}
puts

# uptop loop
5.upto(7) {|i| print(i, " ")}
puts

# range loop
('a'..'z').each {|letter| print(letter, " ")}
puts

# unless calls the action only if unless condition is false
puts 'unless test' unless false

# step loop
10.step(20, 2) {|i| print(i, " ")} # 10 12 14 16 18 20
puts

# case (switch)
def negative_message(number)
  case
  when number > 0
    "The number is positive"
  when number == 0
    "The number is zero"
  else
    "The number is negative"
  end
end
puts negative_message(-10)
puts negative_message(10)

# case with parameter
def number_name(number)
  case number # comparison is done using ===
  when  1 then "the number one"
  when 2..10
    "a number between 2 and 10"
  else
    "a number greater than 10"
  end
end
puts number_name(1)
puts number_name(5)
puts number_name(11)

# traditional expressions also return values
test_result = if 1<0
                "The test was true"
              else
                "The test was false"
              end
puts test_result

# begin end while blocks always execute at least once
puts "Hello!" while false
begin
  puts "Goodbye!"
end while false

# infinite loop
loop do
  puts "This will not be printed forever"
  break
end

# for differs from .each in tems of variable scope
[0,1,2].each do |i|
  local_each_var = i
end
begin
  puts "local_each_var is defined: #{local_each_var}"
rescue
  puts "local_each_var does not exist"
end

for i in [0,1,2]
  local_for_var = i
end
puts "local_for_var is defined: #{local_for_var}"

# break - exists a block
print 'break - '
for i in [0,1,2]
  break if i == 1
  print i, ' '
end
puts

# redo - re-executes the current iteration
print 'redo - '
for i in [0,1,2]
  if i == 1
    i = 10
    redo
  end
  print i, ' '
end
puts

# next - skips the current iteration
print 'next - '
for i in [0,1,2]
  next if i == 1
  print i, ' '
end
puts

# retry - re-executes the whole loop - only works on a rescue block #TODO - VERSION
# apparently this is not supported anymore
# print 'retry - '
# retry_loop = true
# for i in [0,1,2]
#   if i == 1 && retry_loop
#     raise "This is an error"
#     retry
#   end
#   print i, ' '
# end
# puts
