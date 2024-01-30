class Game
    attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight
  
    def initialize(my_game)
      @human_player = HumanPlayer.new(my_game)
      @enemies = Array.new(4) { |i| Player.new("Player#{i + 1}") }
      @players_left = 10
      @enemies_in_sight = []
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def is_still_ongoing?
      @human_player.life_point > 0 && (@players_left > 0 || !@enemies_in_sight.empty?)
    end
  
    def show_players
      puts "Joueur humain :"
      @human_player.show_state
      puts "Les ennemis :"
      @enemies.each { |enemie| enemie.show_state }
    end
  
    def menu
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts "Attaquer un joueur en vue :"
  
      @enemies.each_with_index do |enemie, index|
        puts "#{index} - #{enemie.name} a #{enemie.life_point} points de vie"
      end
    end
  
    def menu_choice(choice)
      case choice
      when "a"
        @human_player.search_weapon
      when "s"
        @human_player.search_health_pack
      else
        index = choice.to_i
        if index.between?(0, @enemies.length - 1)
          @human_player.attack(@enemies[index])
          kill_player(@enemies[index]) if @enemies[index].life_point <= 0
        else
          puts "Choix invalide"
        end
      end
    end
  
    def enemies_attack
      puts "AU TOUR DES ENNEMIS : "
      @enemies.each do |enemie|
        enemie.attack(@human_player) if enemie.life_point > 0
      end
    end
  
    def new_players_in_sight
      if @enemies_in_sight.length >= @players_left
        puts "Tous les joueurs sont déjà en vue."
        return
      end
  
      dice_result = rand(1..6)
  
      case dice_result
      when 1
        puts "Aucun nouveau joueur adverse n'arrive."
      when 2..4
        new_enemy = Player.new("enemies#{rand(5..20)}")
        @enemies << new_enemy
        @players_left -= 1
        puts "Un nouvel adversaire, #{new_enemy.name}, arrive en vue."
      when 5..6
        2.times do
          new_enemy = Player.new("enemies#{rand(5..20)}")
          @enemies << new_enemy
          @players_left -= 1
        end
        puts "Deux nouveaux adversaires arrivent en vue."
      end
    end
  
    def end
      if @human_player.life_point > 0
        puts "Trop fort, tu as gagné !"
      else
        puts "Trop nul, tu es mort..."
      end
    end
  end
  