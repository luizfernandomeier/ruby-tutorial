# print something on the screen
print "Hello World!\n"

# puts automatically adds a new line
def get_hello_message(name)
  result = "Hello #{name}!"
  return result
end

puts get_hello_message("World")
