def call_block
  puts 'Doing something'
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
def call_block_with_parameter(name)
  puts "Doing something for #{name}"
  yield(name, 'China')
  puts 'Have done it already'
end

call_block_with_parameter('John') {|name, country| puts "This is another code block that #{name} from #{country} requested.." }

call_block_with_parameter('Eric') do |name, country|
  puts "This is another code block that #{name} from #{country} requested.."
end
