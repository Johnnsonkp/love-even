require "tty-prompt"

def menu_input_select
    puts " "
    prompt = TTY::Prompt.new
    choices = [
        {name: 'Create a new account', value: 1},
        {name: 'Display user account details', value: 2},
        {name: 'Display running schedule', value: 3},
        {name: 'Update schedule', value: 4},
        {name: 'Quit', value: 5}

    ]
    
    user_input = prompt.select("What would you like to do?", choices)
end

def quit_program
    puts "Are you sure you want to quit?"
    answer = gets.chomp
    if answer.downcase == 'yes'
        puts "Goodbye"
        exit
    end
end