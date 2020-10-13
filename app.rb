require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def start_to_play                                                          # Methode qui va lencer le jeu
  player1 = Player.new("Prout")                                            #creation nouveaux objets Player
  player2 = Player.new("Pouet")
    while player1.life_points > 0 && player2.life_points > 0              # Tant que les Players ont des PV, la partie continue
      puts ""                                                           
      puts "<3<3<3    Voici l'etat de chaque joueurs    <3<3<3"
      player1.show_state                                                  #affiche l'etats des Players
      player2.show_state
      puts ""
      puts "---------------------------------------------------"
      puts "Phase d'attaque : "
      print ">>>>>>>>>>>>>>> Pressez un bouton <<<<<<<<<<<<<<<"           # Permet juste de temporisé

      ok = gets.chomp
    puts ""

      player2.attacks(player1)                                              # Player 2 attaque Player 1
    if player1.life_points <= 0                                             # Si P1 n'a plus de PV, la partie est fini
        puts " Fin de partie"                                           
      break
    else                                                                    # Sinon ça continue
      player1.attacks(player2)
      puts ""
      puts "---------------------------------------------------"
      puts ""    
    end
  end
end

puts "Lancer l'application ?"                                               # Permet juste de temporiser           
print "..."
l = gets.chomp
start_to_play