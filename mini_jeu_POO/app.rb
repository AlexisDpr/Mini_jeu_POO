require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Création des joueurs
player1 = Player.new("Josiane")
player2 = HumanPlayer.new("José")

# Affichage de l'état des joueurs
puts "Voici la santé de chaque joueur :"
player1.show_state
player2.show_state
puts "\n"

# Début du combat
puts "Passons à la phase d'attaque :"
puts "\n"

# Boucle du combat
while player1.life_points > 0 && player2.life_points > 0 do
    puts "Voici la santé restante de chaque joueur :"
    player1.show_state
    player2.show_state

    puts "Passons à la phase d'attaque :"
    player1.attacks(player2)
    break if player2.life_points <= 0
    player2.attacks(player1)
  end
  puts "\n"
  
  # Annonce de la fin du combat
  puts "Le combat est terminé !"
  if player1.life_points <= 0
    puts "#{player2.name} a gagné !"
  elsif player2.life_points <= 0
    puts "#{player1.name} a gagné !"
  end

binding.pry
