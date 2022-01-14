
def show_welcome_message(name, year=2010)
  puts("Welcome to #{year}, #{name}!")
end

# because of precedence rules, it is recommended to use parentheses in all but the simplest cases
show_welcome_message("Luiz", "2020")
show_welcome_message "Fernando", 2019
show_welcome_message "Meier"
