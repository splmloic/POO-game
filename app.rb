require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_point > 0 && player2.life_point > 0
    puts " "
    puts "Voici l'état de chaque joueur : "
    player1.show_state
    player2.show_state
    puts " "
    puts "Passons à la phase d'attaque :"
    player1.attack(player2)
    if player2.life_point <= 0
        break
    end
    player2.attack(player1)
    sleep(2)
    puts " "
    puts "------------------------"
end
#binding.pry
