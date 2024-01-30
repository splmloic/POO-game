class Game
    attr_accessor :human_player, :enemies
    def initialize(my_game)
        @human_player = HumanPlayer.new(my_game)
        @enemies = Array.new(4) {|i| Player.new("Player#{i + 1}")}
    end

    def kill_player(player)
        @enemies.delete(player)
    end

    def is_still_ongoing?
        @human_player.life_point > 0 && !@enemies.empty?
    end

    def show_players
        puts "Joueur humain :"
        @human_player.show_state
        puts " les Ennemis :"
        @enemies.each { |enemie| enemie.show_state }
    end

    def menu
        puts "quelle action veut tu effectué"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "ATTAQUER UN JOUEUR EN VUE :"

        @enemies.each_with_index do |enemy, index|
            puts "#{index} - #{enemy.name} a #{enemy.life_point} points de vie"
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
        puts "AU TOUR DES ENEMIES : "
        @enemies.each do |enemies|
            if enemies.life_point > 0
                enemies.attack(@human_player)
            end
        end
    end

    def end
        if @human_player.life_point > 0
            puts "Trop fort t'as gagné"
        else
            puts "trop nul tes mort"
        end
    end
end