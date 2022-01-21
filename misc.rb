# execute a command on the operating system
output = `date`
puts output.class
print output
puts

# puts Kernel.`("date")
puts Kernel.`("date").class

# output of the command
puts $?

# run dynamic code
a = nil
eval("a = 1 + 1")
puts a # 2
