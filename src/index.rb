require 'tty-prompt'
require 'tty-font'
require 'pastel'

pastel = Pastel.new
prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)


puts pastel.on_black(pastel.red(font.write("LOVE EVEN?")))
