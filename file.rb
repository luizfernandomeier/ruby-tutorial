f = File.open("sample_file.txt")
f.each {|line| puts line }
f.close

# TODO: I didn't get this one right - why I don't have to close the file here?
# the block is being passed on to `grep`, no to `open`.
f = File.open("sample_file.txt").grep(/^This/) {|line| puts line }
