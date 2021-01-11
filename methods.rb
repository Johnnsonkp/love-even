require 'pastel'
require "tty-prompt"
require 'tty-font'
require 'terminal-table'
require 'json'

# database_json = File.open("./user/database.json", "a")

pastel = Pastel.new
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)

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
    puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
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


    short_q = {}
    puts "What is your significant partner looking for?"

    partners = [
        {name: 'partner one', value: 1},
        {name: 'partner two', value: 2},
        {name: 'partner three', value: 3},
        {name: 'partner four', value: 4}
    ]

    system "clear"
    #puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
    puts " "
    partner1 = prompt.select("What is your significant partner looking for?", partners)

    short_q['partner1'] = partner1

    puts "What is your significant partner looking for?"

    partners = [
        {name: 'partner five', value: 1},
        {name: 'partner six', value: 2},
        {name: 'partner seven', value: 3},
        {name: 'partner eight', value: 4}
    ]

    system "clear"
    #puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
    puts " "
    partner2 = prompt.select("What is your significant partner looking for?", partners)
    puts "What is your significant partner looking for?"

    short_q['partner2'] = partner2

    partners = [
        {name: 'partner nine', value: 1},
        {name: 'partner ten', value: 2},
        {name: 'partner eleven', value: 3},
        {name: 'partner twelve', value: 4}
    ]

    system "clear"
    #puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
    puts " "
    partner3 = prompt.select("What is your significant partner looking for?", partners)
    short_q['partner3'] = partner3
    puts "What is your significant partner looking for?"

    partners = [
        {name: 'partner thirteen', value: 1},
        {name: 'partner fourteen', value: 2},
        {name: 'partner fifthen', value: 3},
        {name: 'partner sixteen', value: 4}
    ]

    system "clear"
    #puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
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
def choose_questionare_type
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    notice = Pastel.new.red.on_black.bold.detach
    prompt = TTY::Prompt.new(active_color: notice)
    
    choices = [
        {name: 'Quick Mode', value: 1},
        {name: 'Full questionaire', value: 2},
    ]

    system "clear"
    # puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
    puts " "
    user_input = prompt.select("Choose questionare type?", choices)
    case user_input
    when 1
        #intermittent
        short_questionare
    when 2 
        #intermittent
        long_questionare
    end

end

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
def get_database
    require "json"
    require 'json/pure'
    puts "its working!!"

    # database = File.readlines("./user/database.json")
    
    # database.

    # array = File.readlines(@file_path).map {|name| name.strip}

    file = open("./user/database.json")
    json = file.read
    parsed = JSON.parse(json)
    $parsed = parsed

    puts "your name is #{parsed['name']}"
    puts "You were born on #{parsed['dob']}"
    puts "You're currently #{parsed['relationship']}"
    puts "But you wish your were #{parsed['ideal_relationship']}"
end

########################################### user_login
#######################################################

def user_login
    file = open("./user/database.json")
    json = file.read
    parsed = JSON.parse(json)

    puts "Enter name"
    name = gets.chomp

    if (name == parsed['name'])
        puts "Welcome #{parsed['name']}"
    else
        puts "name is invalid, try again!"
    end
end