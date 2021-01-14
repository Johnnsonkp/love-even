class User

    attr_reader :create_user, :choose_questionare_type, :get_database, :delete

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
        require 'terminal-table'

        pastel = Pastel.new
        font = TTY::Font.new(:standard)
        notice = Pastel.new.red.on_black.bold.detach
        file = open("./user/database.json")
        json = file.read
        parsed = JSON.parse(json)
        
        user_data = {
            :Name => "#{parsed['name']}",
            :DOB => "#{parsed['dob']}",
            :Current_relationship_status => "#{parsed['relationship']}",
            :Ideal_relationship_status => "#{parsed['ideal_relationship']}"
        }
        
        puts " "
        puts pastel.red.on_black.bold("Current user" )
        user_data.each do |key, value|
            rows = []
            rows << ["#{value}"]
            table = Terminal::Table.new :headings => ["#{key}"], :rows => rows
            table.align_column(1, :center)
            table.style = {:width => 150, :padding_left => 3, :border_x => "=", :border_i => "x"}
            puts table
        end
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

    def delete_user
        require 'json'
        file = File.read("./user/database.json")
        data_hash = JSON.parse(file)

        puts "What would you like to delete?"
        str = gets.chomp

        # data_hash.each do |j|
        #     j.delete('str')
        # end
        puts str
        data_hash.delete["str"]
        File.write('./user/database.json', JSON.dump(data_hash))

    end
end