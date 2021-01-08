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

while true
    case menu_input_select
    when 1 
        puts "true"
        false
    when 5 
        quit_program
    end
end