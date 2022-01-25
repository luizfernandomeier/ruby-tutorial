f = File.open("sample_file.txt")
f.each {|line| puts line }
f.close
puts '--------'

# TODO: try to simulate an error on a file that is not closed properly, then see if this one closes it:
f = File.open("sample_file.txt").grep(/^This/) {|line| puts line }
puts '--------'

f = File.new("sample_file.txt", "r") # "r" is the default mode (reading); w is writing; r+ is reading and writing; a is appending
f.each_line { |line| puts line }
f.seek(0) # go back to the beginning of the file
f.each_byte { |ch| print "."; putc ch }
f.close
puts '--------'

# create a new file - IO
f = File.new("dummy_file.txt", "a") # append also creates the file if it doesn't exist
f.puts "PUTS"
f.print "PRINT\n"
f << "<<\n"
f << "\001\002\007" # binary data
f.close

File.open("dummy_file.txt") do |f|
  f.each {|line| puts line }
end
puts '--------'

# delete file
File.delete("dummy_file.txt")
