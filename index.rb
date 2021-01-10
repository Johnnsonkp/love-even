require_relative "methods"
require 'tty-prompt'
require 'tty-font'
require 'pastel'
require 'tty-pie'
require 'tty-progressbar'
require 'terminal-table'

pastel = Pastel.new
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)

puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
puts "Welcome to Love Even?"
intermittent

while true
    case menu_input_select
    when 1 #Create an account
        puts "New account"
        intermittent
    when 2 #Login
        puts "login"
        intermittent
    when 3 
        quit_program
    end
end

