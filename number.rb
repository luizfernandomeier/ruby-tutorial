puts float_number = 3.14159
puts float_number.class # Float
printf("%0.100f\n", float_number) # shows the float imprecision

puts float_number.to_i # 3
puts float_number.to_i.class # Integer

puts float_number += 1 # there is no ++ operator in Ruby

# Fixnum and Bignum were unified in Ruby 2.4
num = 100
6.times do
  puts "#{num} = #{num.class}"
  num *= num
end

# it is possible to use underscores in numbers, Ruby ignores them
puts 100_000_000 # 100000000

# use 0 prefix to convert to octal, hexadecimal or binary
puts 0377 # 255
puts 0xff # 255
puts 0b11111111 # 255

# absolute value
puts -10.abs # 10

# cast is needed before performing math operations
puts "1" + "2" # "12"
puts "1".to_i + "2".to_i # 3

# test zero value
puts 0.zero?
