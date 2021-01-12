class User

    attr_reader :create_user, :choose_questionare_type, :get_database

    def initialize(create_user, parsed)
        @create_user = create_user
        @parsed = parsed
    end

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

    def get_database
        require "json"
    
        file = open("./user/database.json")
        json = file.read
        parsed = JSON.parse(json)
    
        puts "your name is #{parsed['name']}"
        puts "You were born on #{parsed['dob']}"
        puts "You're currently #{parsed['relationship']}"
        puts "But you wish your were #{parsed['ideal_relationship']}"
    end

    def create_user
        require 'json'
        database = {}
        temp = {}
        ############### question 1 ##################
        puts "What is your name?"
        name = gets.chomp
        # database['name'] = name
        system "clear"
    
        ############### question 2 ##################
        puts "Whats your date of birth?(dd/mm/yyyy)"
        dob = gets.chomp
        # database['dob'] = dob
        system "clear"
        
        ############### question 3 ##################
        puts "Whats is your current relationship status?"
        relationship = gets.chomp
        # database['relationship'] =relationship
        system "clear"
        
        ############### question 4 ##################
        puts "What is your ideal relationship status?"
        ideal_relationship = gets.chomp
        # database['ideal_relationship'] = ideal_relationship
        system "clear"

        ######### addiing data to json file ###########
        require 'json'
        file = File.read("./user/database.json")
        data_hash = JSON.parse(file)

        data_hash['name'] = name
        data_hash['dob'] = dob
        data_hash['relationship'] = relationship
        data_hash['ideal_relationship'] = ideal_relationship

        File.write("./user/database.json", JSON.dump(data_hash))
        # File.open("./user/database.json", "a") do |f|
        #     # f.write(database)
        #     json = JSON.generate[1]{database}
        # end
    
    end 
end