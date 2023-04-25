class Player
    attr_accessor :name, :life_points
  
    def initialize(name)
      @name = name
      @life_points = 10
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie"
    end
  
    def compute_damage
      rand(1..6)
    end
  
    def attacks(player)
      damage = compute_damage
      puts "#{@name} attaque #{player.name}"
      player.gets_damage(damage)
      puts "il lui inflige #{damage} points de dommages"
    end
  
    def gets_damage(damage_received)
      @life_points -= damage_received
      @life_points = 0 if @life_points < 0
    end
  end
  
  
  class HumanPlayer
    attr_accessor :name, :life_points, :weapon_level
  
    def initialize(name)
      @name = name
      @life_points = 100
      @weapon_level = 1
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        if new_weapon_level > @weapon_level
          @weapon_level = new_weapon_level
          puts "Yaaaaah ! elle est meilleure que ton arme actuelle : tu la prends."
        else
          puts "F*ck... elle n'est pas mieux que ton arme actuelle... poubelle"
        end
    end

    def search_health_pack
        dice = rand(1..6)
        case dice
        when 1
          puts "Tu n'as rien trouvé, dommage"
        when 2..5
          @life_points += 50
          @life_points = 100 if @life_points > 100
          puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        when 6
          @life_points += 80
          @life_points = 100 if @life_points > 100
          puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
      end

    def compute_damage
        rand(1..6) * @weapon_level
      end      
      
    def attacks(player)
      damage = compute_damage
      puts "#{@name} attaque #{player.name}"
      player.gets_damage(damage)
      puts "il lui inflige #{damage} points de dommages"
    end
  
    def gets_damage(damage_received)
      @life_points -= damage_received
      @life_points = 0 if @life_points < 0
    end
  end
  