# method and argument names must use lowercase letters and underscores (snake_case)
# method names can also end with the characters =, ! or ?

# method with default argument
def show_welcome_message(name, year=2010)
  puts("Welcome to #{year}, #{name}!")
end

# because of precedence rules, it is recommended to use parentheses in all but the simplest cases
show_welcome_message("Luiz", "2020")
show_welcome_message "Fernando", 2019
show_welcome_message "Meier"

# method with implicit return
def sum(a, b)
  a + b
end
puts "Sum result: #{sum(1, 2)}"

# method that forwards whatever parameters it receives to another method
# the name of the parameter is irrelevant: the * operator is whats matters
def sum_with_forwarding(*args)
  sum(*args)
end
puts "Forwarded sum result: #{sum_with_forwarding(1, 2)}"
