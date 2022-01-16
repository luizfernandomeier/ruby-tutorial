# TODO: this example is not working (page 76)
# the b variable is not being replaced by the block parameter
# maybe it is outdated
a = [1, 2]
b = 'cat'
a.each {|b| c = b * a[1] }
puts "a: #{a}, b: #{b}"
puts defined?(c) == nil
