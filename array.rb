# arrays can have multiple types
multitype_array = [1, 'dog', "cat", 3.14, nil, true]
puts multitype_array.class # Array
puts multitype_array.length # 6
print multitype_array
puts

# first element
puts multitype_array[0] # 1

# last element
puts multitype_array[multitype_array.length-1] # true

# last element either (counting backwards)
puts multitype_array[-1] # true

# returns nil if index is out of bounds
puts multitype_array[multitype_array.length] # nil

# return a new array based on the interval [start, count]
print multitype_array[1, 3]
puts

# return a new array based on the range [start, end] - .. means including the end position
print multitype_array[1..3]
puts

# return a new array based on the range [start, end] - ... means excluding the end position
print multitype_array[1...3]
puts

# change the second element
multitype_array[1] = "doggo"
puts multitype_array[1]

# add an element
multitype_array << "new element"
puts multitype_array[multitype_array.length-1]

# array creation shortcut - just works with strings
shortcut_array = %w{one two three}
puts shortcut_array

# another ways of starting an array
array1 = Array.new
puts "#{array1.class}[#{array1.length}]"

array2 = []
puts "#{array2.class}[#{array2.length}]"

# assign array with gaps result in nil values
replaceable_array = [1,3,5,7,9]
replaceable_array[6] = 11
print replaceable_array # 1,3,5,7,9,nil,11
puts

# replacing two elements
replaceable_array[2,3] = 'dog' # [start, count]
print replaceable_array # 1,3,dog,nil,11
puts

# insert element
replaceable_array[3,0] = 'cat'
print replaceable_array # 1,3,dog,cat,nil,11
puts

# replace with a collection of elements
replaceable_array[3,1] = ['black cat', 'white cat']
print replaceable_array # 1, 3, dog, black cat, white cat, nil, 11
puts

# remove elements
replaceable_array[3,2] = []
print replaceable_array # 1, 3, dog, nil, 11
puts

# push
replaceable_array.push(12)
print replaceable_array # 1, 3, dog, nil, 11, 12
puts

# pop
puts replaceable_array.pop # 12
print replaceable_array # 1, 3, dog, nil, 11
puts

# shift
puts replaceable_array.shift # 1
print replaceable_array # 3, dog, nil, 11
puts

# iterators
replaceable_array.each do |element|
  if element.to_s.length > 1
    puts element
    break
  end
end

# returns the first element that matches the condition
puts replaceable_array.find{|element| element.to_s.length > 1} # dog

# the difference between each and collect is that collect returns a new array
puts ["H", "A", "L"].collect {|element| element.succ}

# inject takes an initial value and performs an operation on each element
# if no initial value is provided, the first element of the array is considered, and iteration begins on the second value
puts [1,3,5,7].inject {|sum, element| sum + element} # 16
puts [1,3,5,7].inject {|product, element| product * element} # 105

# check if an array contains a value
puts ["Luiz", "Fernando"].index("Meier").nil? # true

# sort
print [2,1,8,4,8,6,4,1].sort # [1, 1, 2, 4, 4, 6, 8, 8]
puts

# sort reverse
print [2,1,8,4,8,6,4,1].sort.reverse # [8, 8, 6, 4, 4, 2, 1, 1]
puts
