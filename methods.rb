require 'pastel'
require "tty-prompt"
require 'tty-font'
require 'terminal-table'
require 'json'
require 'tty-box'

# database_json = File.open("./user/database.json", "a")
pastel = Pastel.new
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)

########################################### Welcome message #######################################################
def welcome_message
    require 'tty-box'
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)

    # Welcome message box styling and color
    box = TTY::Box.frame(width: 100, height: 10, padding: 1, border: :thick, align: :center, title: {top_left: " <3 ", bottom_right: "v1.0"}, style: {  fg: :blue, bg: :black}) do
        pastel.red(font.write("     LOVE EVEN?    " ))
    end
    print box 
end

########################################### Menu input options #######################################################
def inner_menu
    puts " "
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)


    choices = [
        {name: 'Update information', value: 1},
        {name: 'Display information', value: 2},
        {name: 'Delete information', value: 3},
        {name: 'Quit', value: 4}
    ]

    system "clear"
    welcome_message
    puts " "
    user_input = prompt.select("What would you like to do?", choices)
end

########################################### Greeting #######################################################
def greeting
    require 'pastel'
    require 'tty-font'
    pastel = Pastel.new
    notice = Pastel.new.red.on_black.bold.detach
    font = TTY::Font.new(:standard)
    
    puts " "
    puts "Welcome to Love Even?"
    puts " "
    puts pastel.red(notice["The number one app for empowering users \ninto making better informed romantic decisions"])
    puts " "
    intermittent
end

########################################### Menu input options #######################################################
def menu_input_select
    puts " "
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)


    choices = [
        {name: 'Login', value: 1},
        {name: 'Create a new account', value: 2},
        {name: 'Display information', value: 3},
        {name: 'Quit', value: 4}
    ]

    system "clear"
    welcome_message
    puts " "
    user_input = prompt.select("What would you like to do?", choices)
end
########################################### quit program #######################################################
def quit_program
    puts "Are you sure you want to quit?"
    answer = gets.chomp
    if answer.downcase == 'yes'
        puts "Goodbye"
        exit
    end
end

########################################### intermittent #######################################################
def intermittent
    puts "Press any key to continue"
    gets
    system "clear"
end

########################################### short questionare #######################################################
def short_questionare 
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)

    system "clear"
    puts " "

    ######### Question 1 #########
    short_q = {}

    partners = [
        {name: '6 months or less', value: 1},
        {name: '9 months or less', value: 2},
        {name: '12 months or less', value: 3},
        {name: '1 year+', value: 4}
    ]
    system "clear"
    puts " "
    welcome_message
    partner1 = prompt.select("How long was your longest relationship?", partners)
    short_q['partner1'] = partner1

    ######### Question 2 #########
    partners = [
        {name: 'Never', value: 1},
        {name: 'Yes, I am a regular', value: 2},
        {name: 'Yeah kinda', value: 3},
        {name: 'Yeah, once in a while', value: 4}
    ]

    system "clear"
    puts " "
    welcome_message
    partner2 = prompt.select("Do you come here often?", partners)
    short_q['partner2'] = partner2

    ######### Question 3 #########
    partners = [
        {name: '5ft or under', value: 1},
        {name: '5ft 5 inches or under', value: 2},
        {name: 'partner eleven', value: 3},
        {name: '6ft plus', value: 4}
    ]

    system "clear"
    puts " "
    welcome_message
    partner3 = prompt.select("How tall are you?", partners)

    ######### Question 4 #########
    short_q['partner3'] = partner3

    partners = [
        {name: 'partner thirteen', value: 1},
        {name: 'partner fourteen', value: 2},
        {name: 'partner fifthen', value: 3},
        {name: 'partner sixteen', value: 4}
    ]

    system "clear"
    puts " "
    partner4 = prompt.select("What is your significant partner looking for?", partners)
    short_q['partner4'] = partner4 
    out = short_q
    return out
end

########################################### Long questionare #######################################################
def long_questionare
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)


    puts "What is your significant partner looking for?"
    puts "What is your significant partner looking for?"
    puts "What is your significant partner looking for?"
    puts "What is your significant partner looking for?"
    puts "What is your significant partner looking for?"
    puts "What is your significant partner looking for?"
    puts "What is your significant partner looking for?"

end

########################################### questionare select #######################################################
# def choose_questionare_type
#     pastel = Pastel.new
#     font = TTY::Font.new(:standard)
#     notice = Pastel.new.red.on_black.bold.detach
#     prompt = TTY::Prompt.new(active_color: notice)
    
#     choices = [
#         {name: 'Quick Mode', value: 1},
#         {name: 'Full questionaire', value: 2},
#     ]
#     system "clear"
#     # puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
#     puts " "
#     user_input = prompt.select("Choose questionare type?", choices)
#     case user_input
#     when 1
#         #intermittent
#         short_questionare
#     when 2 
#         #intermittent
#         long_questionare
#     end

# end

########################################### Create user #######################################################
def create_user
    require 'json'

    database = {}
    temp = {}
    puts "Whats is your name?"
    name = gets.chomp
    # temp['name'] = name
    database['name'] =name

    puts "Whats your date of birth?(dd/mm/yyyy)"
    dob = gets.chomp
    # temp['dob'] = dob
    database['dob'] =dob

    puts "Whats is your current relationship status?"
    relationship = gets.chomp
    # temp['relationship'] = relationship
    database['relationship'] =relationship

    puts "What is your ideal relationship status?"
    ideal_relationship = gets.chomp
    # temp['ideal_relationship'] = ideal_relationship
    database['ideal_relationship'] =ideal_relationship

    # questions = choose_questionare_type
    # # temp['questions'] = questions 
    # database['questions'] = questions

    # $temp_j = temp.to_json
    database = database.to_json
    # p temp_j
    #render :json => temp_j

    
    File.open("./user/database.json", "a") do |f|
        f.write(database)
    end
    # #$database.append(temp)
    # # JSON.parse $temp_j

    # file = open("./user/database.json")
    # json = file.read

    # parsed = JSON.parse(json)

    # puts parsed


end

########################################### Get user information #######################################################
# def get_database
#     require "json"
#     require 'json/pure'
#     puts "its working!!"

#     file = open("./user/database.json")
#     json = file.read
#     parsed = JSON.parse(json)
#     $parsed = parsed

#     puts "your name is #{parsed['name']}"
#     puts "You were born on #{parsed['dob']}"
#     puts "You're currently #{parsed['relationship']}"
#     puts "But you wish your were #{parsed['ideal_relationship']}"
# end

########################################### user_login
#######################################################

def user_login
    file = open("./user/database.json")
    json = file.read
    parsed = JSON.parse(json)

    puts " "
    puts "Enter username"
    username = gets.chomp
    puts " "

    puts "Enter password"
    password = gets.chomp
    puts " "

    if (username == parsed['username'] and password == parsed['password'])
        puts "Welcome #{parsed['name']}"
    else
        puts "name is invalid, try again!"
    end
end

########################################### display information
#######################################################
def what_to_display
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)


    
    choices = [
        {name: 'User information', value: 1},
        {name: 'Significant other information', value: 2},
        {name: 'Go back', value: 3}
    ]
    system "clear"
    welcome_message
    puts " "
    user_input = prompt.select("What to display?", choices)
end