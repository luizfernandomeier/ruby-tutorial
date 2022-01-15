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

# in ruby, nil is an actual object
nil_a = nil
nil_b = nil
puts nil_a == nil_b # true

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
