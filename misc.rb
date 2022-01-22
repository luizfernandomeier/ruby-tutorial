# require calls the file only once (given the same exact path)
# only prints "SAMPLE" once:
require "./sample_ruby"
require "./sample_ruby"
puts "-----"

# loads calls the file N times - load needs the full filename
# prints "SAMPLE" N times:
load "./sample_ruby.rb"
load "./sample_ruby.rb"
puts "-----"

# execute a command on the operating system
output = `date`
puts output.class
print output
puts

# puts Kernel.`("date") # same as above

# output of the command
puts $?

# run dynamic code
a = nil
eval("a = 1 + 1")
puts a # 2
