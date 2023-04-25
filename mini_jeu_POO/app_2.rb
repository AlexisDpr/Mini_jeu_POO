require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Affichage du message de démarrage
puts "------------------------------------------------"
puts "|Bienvenue sur 'GET READY FOR THE NEXT BATTLE' ! |"
puts "|Soyez le dernier survivant dans POO !           |"
puts "-------------------------------------------------
\n\n"
sleep 2
# Initialisation du joueur
print "Quel est votre nom ? "
user = gets.chomp
user = HumanPlayer.new(user)

# Initialisation des ennemis
enemy_1 = Player.new("Josiane")
enemy_2 = Player.new("José")
enemies = [enemy_1, enemy_2]

# Boucle de jeu
while user.life_points > 0 && (enemy_1.life_points > 0 || enemy_2.life_points > 0)
  puts "Voici l'état de chaque joueur :"
  puts user.show_state
  puts enemy_1.show_state
  puts enemy_2.show_state
  sleep 2
  puts " "
  puts " ->Quelle action veux-tu effectuer ?"
  sleep 1
  puts "a - chercher une meilleure arme"
  sleep 1
  puts "s - chercher à se soigner"
  sleep 1
  puts " -> Ou attaquer un joueur :"
  sleep 1
  puts "0 - Attaquer Josianne (qui surveille ses voisins derrière ses rideaux) #{enemy_1.show_state}"
  sleep 1
  puts "1 - Attaquer José (qui fait des travaux le dimanche matin) #{enemy_2.show_state}"
  puts " "
  action = gets.chomp
  
  case action
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(enemy_1)
  when "1"
    user.attacks(enemy_2)
  else
    puts "Je n'ai pas compris, merci de réessayer."
  end
  sleep 2
  puts " "
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end
end  

# Affichage du message de fin
puts "\n\n La partie est finie !"
if user.life_points > 0 && (enemy_1.life_points <= 0 && enemy_2.life_points <= 0)
  puts "Bravo, tu as gagné :) !"
else
  puts "Perdu ! Retente ta chance :)"
end

binding.pry