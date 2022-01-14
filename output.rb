# print something on the screen
print "Hello World!\n"

# puts automatically adds a new line
def get_hello_message(name)
  result = "Hello #{name}!"
  return result
end

puts get_hello_message("World")

# printf can control the ouput format - it adds a new line at the end
printf("Number: %5.2f,\nString: %s\n", 1.2345, 'hello')
