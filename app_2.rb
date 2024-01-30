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
user = HumanPlayer.new(gets.chomp.to_s)
puts "très bien #{user.name}, la partie peut débuter"
puts "Initialisation des enemies"
enemies = []
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")
puts "------------------------------------------------"
puts " "

choise = " "

while user.life_point > 0 && ((enemies[0]).life_point > 0 || (enemies[1]).life_point > 0)
    puts "quelle action veut tu effectué"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    choise = gets.chomp
    until choise == "a" || choise == "s" do 
        choise = gets.chomp
    end
    if choise == "a"
        user.search_weapon
    elsif choise == "s"
        user.search_health_pack
    end
    puts " "
    puts "------------------------------------------------"
    pause = gets.chomp
    puts " "
    puts "ATTAQUER UN JOUEUR EN VUE :"
    puts "0 - #{enemies[0].name} a #{enemies[0].life_point} points de vie"
    puts "1 - #{enemies[1].name} a #{enemies[1].life_point} points de vie"
    choise = gets.chomp.to_s
    until choise == "0" || choise == "1" do 
        choise = gets.chomp.to_s
    end
    if choise == "0"
        user.attack(enemies[0])
    elsif choise == "1"
        user.attack(enemies[1])
    end
    puts " "
    puts "------------------------------------------------"
    pause = gets.chomp
    puts " "
    puts "AU TOUR DES ENEMIES : "
    enemies.each do |enemies|
        if enemies.life_point > 0
            enemies.attack(user)
        end
    end
    puts " "
    puts "----------FIN DU TOUR---------------------------"
    pause = gets.chomp
    puts " "
end

if user.life_point > 0
    puts "Trop fort t'as gagné"
else
    puts "trop nul tes mort"
end