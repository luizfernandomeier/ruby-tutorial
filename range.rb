# range is an object diferent than an array
# it contains only a reference to the first and last elements

# range loop
('a'..'z').each {|letter| print(letter, " ")}
puts

# range to array
print ('a'..'z').to_a
puts

# range contains
digits = 0..9
puts digits.class # Range
puts digits.include?(5) # true
puts digits.min # 0
puts digits.max # 9
print digits.reject {|i| i % 2 == 0} # 1,3,5,7,9 - retuns an array
puts
