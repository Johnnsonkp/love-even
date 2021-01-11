require_relative "methods"
require 'tty-prompt'
require 'tty-font'
require 'pastel'
require 'tty-pie'
require 'tty-progressbar'
require 'terminal-table'
require 'json'


# database = File.open("./user/database.json", "a")

pastel = Pastel.new
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)




puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
puts "Welcome to Love Even?"
intermittent

while true
    case menu_input_select
    when 1 #Login
        puts "login"
        # intermittent
        user_login
        intermittent


        # puts "New account"
        # intermittent
        # create_user
    when 2 #Create an account
        puts "New account"
        intermittent
        create_user


        # puts "login"
        # # intermittent
        # user_login
        # intermittent
    when 3 
        # get_database
        # quit_program 
        get_database
        intermittent
    when 4
        quit_program
    end
end

