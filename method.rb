# method and argument names must use lowercase letters and underscores (snake_case)
# method names can also end with the characters =, ! or ?
# there is no method overloading in ruby

# method with default argument
def show_welcome_message(name, year=2010)
  puts("Welcome to #{year}, #{name}!")
end

# because of precedence rules, it is recommended to use parentheses in all but the simplest cases
show_welcome_message("Luiz", "2020")
show_welcome_message "Fernando", 2019
show_welcome_message "Meier"

# method with implicit return
def sum(a, b)
  a + b
end
puts "Sum result: #{sum(1, 2)}"

# method that forwards whatever parameters it receives to another method
# the name of the parameter is irrelevant: the * operator is whats matters
def sum_with_forwarding(*args)
  sum(*args)
end
puts "Forwarded sum result: #{sum_with_forwarding(1, 2)}"

# identifies if a block was given
def print_if_block_was_given
  if block_given?
    puts 'Block given! :)'
  else
    puts 'No block given! :('
  end
end
print_if_block_was_given
print_if_block_was_given{ }

# multiple return values
def multiple_return_values
  # explicit return is needed to return multiple values
  return "luiz", "fernando", "meier"
end
print multiple_return_values
puts
first, second, third = multiple_return_values
puts "First: #{first}, Second: #{second}, Third: #{third}"

# array to multiple arguments
def five (a, b, c, d, e)
  puts "a: #{a}, b: #{b}, c: #{c}, d: #{d}, e: #{e}"
end
five(1, 2, *[3, 4, 5])

# if the last parameter is preceded by an &, it is a Proc object
def calc(&block)
  print (1..10).collect(&block)
  puts
end
sum = lambda { |x| x + x }
subtract = lambda { |x| x - x }
multiply = lambda { |x| x * x }
divide = lambda { |x| x / x }
calc(&sum)
calc{ |x| x + x }
calc(&subtract)
calc(&multiply)
calc(&divide)

# hash arguments
def hash_arguments(name, options)
  puts "Name: #{name}, Options: #{options}"
end
# both calls return the same result
hash_arguments("Luiz", { :age => 33, :height => 178 })
hash_arguments("Luiz", :age => 33, :height => 178 ) # :arguments are called symbols - its purpose is to make it clear what is being passed is a name

# operators are in fact just methods - the two lines below are the same
puts 2*2+1
puts 2.*(2).+(1)

# destroying arithmetic - it is possible to redefine even the most fundamental operators
class Integer
  alias old_plus + # alias references the original method

  def +(other)
    self.*(other)
  end
end
puts 3 + 3 # not this is 9
puts 3.old_plus(3) # this is still 6

# fixing mathematics
class Integer
  def +(other)
    self.old_plus(other)
  end
end
puts 3 + 3 # it's 6 again

# defining [] method
class ArrayCapableClass
  def initialize(name)
    @name = name
  end
  def [](index, size)
    @name[index, size]
  end
end

puts ArrayCapableClass.new("Fernando")[2,3] # rna

# assigning methods always return the value they received
class SetterTest
  def setter=(value)
    @value = value
    return 2
  end
end
setter = SetterTest.new.setter = "Luiz"
print setter # Luiz
