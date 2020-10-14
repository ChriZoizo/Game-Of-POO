require 'bundler'
require 'spinning_cursor'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def launcher                                                             # Methode du Launcher
puts "Lancer l'application ?"                                               # Permet juste de temporiser           
gets.chomp                                                                  # temporiser
SpinningCursor.run do                                                       # Curseur animé pour simuler un chargement (nous sommes dans un jeu ^^)
  banner "LOADING..."                                                       #fonctionne grace a une gem
  type :spinner
  action do
  sleep 3
end
  message "LOADED !"                                                          # Chargement terminé
end                                                                         # Ecran titre                             
puts "                        _                           
____          _      _| |    _           _   _     
|    \ _ _ ___| |   _| |_|___| |_ ___ _ _| |_|_|___ 
|  |  | | | -_| |  | . | | .'| . |  _| | |  _| |_ -|
|____/|___|___|_|  |___| |__,|___|_| |___|_| |_|___"
l = gets.chomp
end

def start_to_play                                                          # Methode qui va lencer le jeu
  player1 = Player.new("Prout")                                         #creation nouveaux objets Player
  player2 = Player.new("Pouet")
                 # Tant que les Players ont des PV, la partie continue
      puts ""                                                           
      puts "<3<3<3    Voici l'etat de chaque joueurs    <3<3<3"
      player1.show_state                                                  #affiche l'etats des Players
      player2.show_state
      puts ""
      puts "---------------------------------------------------"
      puts "Phase d'attaque : "
      print ">>>>>>>>>>>>>>> Pressez un bouton <<<<<<<<<<<<<<<"           # Permet juste de temporisé
      gets.chomp
    puts "+++
    ++++
    ++ ++
     ++ ++
      ++ ++
       ++ ++
        ++ ++
         ++ ++
          ++ ++
           ++ ++
            ++ ++
             ++ ++
              ++ ++
               ++ ++             *
                ++ ++            **
                 ++ ++            **
                  ++ ++           ***
                   ++ ++           ***
                    ++ ++          ***
                     ++ ++        ****
                      ++ ++      ****
                       ++ ++    ****
                        ++ ++  ****
                         ++ ++****
                          +++****
                           +****
                           ****%%
                          ****%%%%
                         ****  %%%%
                *       ****    %%%%
                 **    ****      %%%%
                  *** ****        %%%%
                   ******          %%%%
                    ****            %%%%
                                     %%%$$$
                                      %$$$$$
                                      $$$$$$$
                                      $$$$$$$
                                       $$$$$
                                        $$$"

      player2.attacks(player1)                                              # Player 2 attaque Player 1
    if player1.life_points <= 0                                             # Si P1 n'a plus de PV, la partie est fini
puts "┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼
      ███▀▀▀██┼███▀▀▀███┼███▀█▄█▀███┼██▀▀▀
      ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼█┼┼┼██┼██┼┼┼
      ██┼┼┼▄▄▄┼██▄▄▄▄▄██┼██┼┼┼▀┼┼┼██┼██▀▀▀
      ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██┼┼┼
      ███▄▄▄██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██▄▄▄
      ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼
      ███▀▀▀███┼▀███┼┼██▀┼██▀▀▀┼██▀▀▀▀██▄┼
      ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██┼┼┼┼██┼┼┼┼┼██┼
      ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██▀▀▀┼██▄▄▄▄▄▀▀┼
      ██┼┼┼┼┼██┼┼┼██┼┼█▀┼┼██┼┼┼┼██┼┼┼┼┼██┼
      ███▄▄▄███┼┼┼─▀█▀┼┼─┼██▄▄▄┼██┼┼┼┼┼██▄
      "                                           
      break
    else                                                                    # Sinon ça continue
      player1.attacks(player2)
      puts ""
      puts "---------------------------------------------------"
      puts ""    
    end
  end
end

def perform 
  launcher
  start_to_play
end
perform