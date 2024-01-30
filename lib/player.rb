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