# using "" on a string uses more processing, but has more flexibility

# here the \n is not interpreted
puts 'This is a very \nstrange line'

# looks for substitutions
puts "This is a very \nlong line"

# looks for expression interpolations
puts "This is a value: #{1 + 2}"

# simple interpolation without brackets - doens't work with simple variables
$global_name = "Luiz"
@instance_name = "Fernando"
puts "Welcome #$global_name #@instance_name"

# it doesn't complain if the variable doesn't exist
puts "Welcome #@some_non_existent_variable"

# upper case
puts "Hello #{'LUIZ'.upcase}!"

# lower case
puts "Hello #{'LUIZ'.downcase}!"

# capitalize
puts "Hello #{'LUIZ'.capitalize}!"
