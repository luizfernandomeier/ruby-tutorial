def call_block
  puts 'Doing something'
  yield
  yield
  puts 'Have done it already'
end

def call_block_with_parameter(name)
  puts "Doing something for #{name}"
  yield
  yield
  puts 'Have done it already'
end

# this is a code block
call_block { puts "This is a code block.." }

# and so is this
call_block do
  puts "..and so is this."
end

# calling block with parameter
call_block_with_parameter('John') { puts "This is another code block.." }
