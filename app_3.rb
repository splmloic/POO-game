require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts " "
puts "Jeune aventurier quel est ton nom ?"
print "> "
name = HumanPlayer.new(gets.chomp.to_s)

my_game = Game.new(name)

while my_game.is_still_ongoing?
    my_game.new_players_in_sight
    puts "=============================================================="
    my_game.show_players
    puts "=============================================================="
  
    my_game.menu
    print "> "
    choice = gets.chomp
  
    my_game.menu_choice(choice)
  
    my_game.enemies_attack if my_game.is_still_ongoing?
end
  
my_game.end