f = File.open("sample_file.txt")
f.each {|line| puts line }
f.close
