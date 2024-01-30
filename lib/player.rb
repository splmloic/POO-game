class Player
    attr_accessor :name, :life_point
    def initialize(name)
        @name = name.to_s
        @life_point = 10
    end

    def show_state
        puts "#{name} à #{life_point} points de vie"
    end

    def gets_damage(damage_received)
        @life_point = @life_point - damage_received
        if life_point <= 0
            puts "Le joueur #{name} a été tué !"
        end
    end

    def compute_damage
        return rand(1..6)
    end

    def attack(player)
        puts "#{self.name} attaque #{player.name}"
        damage = compute_damage
        puts "#{self.name} infligne #{damage} damage"
        player.gets_damage(damage)
    end
end

class HumanPlayer < Player
    attr_accessor :name, :life_point, :weapon_level

    def initialize(name)
        @name = name
        @life_point = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{name} à #{life_point} points de vie, et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon}"
        if weapon > @weapon_level
            @weapon_level = weapon
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            puts "Merde, cette arme est une arme de daube"
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
            puts "Tu n'a rien trouvé"
        elsif health_pack >=2 && health_pack <=5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_point = [@life_point + 50, 100].min
        else 
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_point = [@life_point + 80, 100].min
        end
    end
    
end