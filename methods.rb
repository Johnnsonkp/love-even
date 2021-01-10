require 'pastel'
require "tty-prompt"
require 'tty-font'
require 'terminal-table'

pastel = Pastel.new
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)


def menu_input_select
    puts " "
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)


    choices = [
        {name: 'Create a new account', value: 1},
        {name: 'Login', value: 2},
        {name: 'Quit', value: 3}
    ]

    system "clear"
    puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
    puts " "
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

def intermittent
    puts "Press any key to continue"
    gets
    system "clear"
end