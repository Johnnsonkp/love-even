require_relative "methods"
require_relative "user"
require 'tty-prompt'
require 'tty-font'
require 'pastel'
# require 'tty-pie'
# require 'tty-progressbar'
require 'terminal-table'
require 'json'
require 'tty-box'


# database = File.open("./user/database.json", "a")
user = User.new("create_user", "get_database")

pastel = Pastel.new
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)

welcome_message
greeting

while true
    case menu_input_select
    when 1 #Login
        puts "login"
        # intermittent
        user_login
        intermittent
    when 2 #Create an account
        intermittent
        user.create_user
        user.choose_questionare_type
        # create_user
    when 3 
        case what_to_display
        when 1
            user.get_database
            intermittent
        when 2
            puts "significant others information here"
            intermittent
        end
    when 4
        quit_program
    end
end

