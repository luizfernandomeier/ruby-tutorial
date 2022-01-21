# simplest error raise
begin
  raise "This is an error"
rescue
  puts "Rescued error: #{$!}"
end

# custom exception class
class CustomException < Exception
  def initialize()
    super("Some custom message")
  end
end

begin
  raise CustomException.new, "Some custom message 2"
rescue # only catches RuntimeError and its subclasses
  puts "Standard rescue will not catch this"
rescue CustomException
  puts "Rescued error: #{$!}"
end

# runtime custom exception class
class CustomRuntimeException < RuntimeError
  def initialize()
    super("Some custom runtime message")
  end
end

begin
  raise CustomRuntimeException.new, "Some custom message 3", caller # caller - omiting the last line of the stack trace
rescue => boom # alias to $!
  puts "Now it will catch this: #{boom}"
  puts $!.backtrace.join("\n")
rescue CustomRuntimeException
  puts "Rescued error: #{$!}"
else
  puts "This only executes if no exception was raised"
ensure # always executed (finally)
  puts "Closing opened resources"
end

# retry - trying 3 times
retry_block = 2
third_time_is_the_charm = 0
begin
  third_time_is_the_charm += 1
  puts 'Retry block'
  if third_time_is_the_charm < 3
    raise "This is an error"
  end
rescue
  if retry_block > 0
    retry_block-=1
    retry
  end
  raise
end

# catch and throw - used kind of differently than in other languages
def get_some_value
  some_value = "A"
  throw :quit_now if some_value == "A"
  some_value
end

catch :quit_now do
  puts "Beginning of the catch block"
  get_some_value
  puts "End of the catch block - will not be printed"
end
