# TODO: check if this is ok
begin
  raise "This is an error"
rescue
  puts "Rescued error: #{$!}"
end
