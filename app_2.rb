require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def landing                 # le launcher
  puts "                        ________
  |__   __/    _   _   _   _   _   _ __    _____  ____
  ___ | | | | | | | | | | | | | | | || |  |  __/ | || |  _
 |    | | | |_| | | | | | |  || | | | | | | |_   | | | |  |
 |    | | |  _  | | | | | |     | | | | | |  _/  | |-,<   |
  |   | | | | | | | |_| | | ||  | | |_| | | |___ | | | | /
   |  |/  |/  |/   |__/|| |/  |/  |__/|/  |____/ |/  |/ /
    |       _______                                    /
     |     |_   __/_____   ____    _____  _____       /
      |      | |__|  /| | | || |  |  __/ |  __/      /
       |     |  _/| | | | | | | | | |    | |__      /
        |    | |  | | | | | |-,<  | |    |  _/     /
         |   | |  | |_| | | | | | | |___ | |___   /
          |  |/   |__/ || |/  |/  |____/ |____/  /
           |          ___   __      _           /
            |        |   | |  /    | /         /
             |        | |   | |    //         /
              |______ | | __ | |  // ________/
                      | |     | |//
                     |___|     |_/

                         -----------------------------------------------
        |>____________  |      Welcome dans mon jeux champion !         |  ____________<|
########[]____________> |   Demmerde toi :) roh ça va c'est un blague!  | <____________[]########
        |>               -----------------------------------------------               <|"
puts ""
puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  PRESS 'ENTER' TO PLAY  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
puts "=============================================> START? <==============================================="
puts ""
         ok = gets.chomp                      
         SpinningCursor.run do                # Curseur animées
          banner "LOADING..."
          type :spinner
          action do
          sleep 3
  end
          message "LOADED !"
  end

  puts "Bonjour a toi mecreant !! Quel est ton nom ?"   # entrée du nom du joueur
  print ">"
  $name = gets.chomp.to_s
  human = HumanPlayer.new($name)

  @arr_player = []                                      #creation ennemis
  @arr_player << player1 = Player.new("Prout")
  @arr_player << player2 = Player.new("Pouet")
    while (player1.life_points > 0 || player2.life_points > 0) && human.life_points >0
    puts ""                                                                       # deroulement partie
    puts "<3<3<3    Voici l'etat des ennemis    <3<3<3"
    puts ""
    player1.show_state
    player2.show_state
    puts ""
    puts "<3<3<3        Voici ton etats         <3<3<3"
    puts ""
    human.show_state
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - chercher de quoi leurs cassé la bouche"
    puts "s - chercher à se soigner (pas sur que tu trouve ^^)"
    puts ""
    puts "attaquer un joueur en vue :"
    if player1.life_points > 0                                        # affichage des etats des joueurs
      puts "=~> 0"
      puts player1.show_state
    end
    if player2.life_points > 0
      puts "=~> 1"
      puts player2.show_state
    end
      puts ""
      puts "------------------------------------------------------------------------------------------------------"
      print ">>>>>>>>>>>>> Choisissez une action <<<<<<<<<<<<<"
      puts "" 
        case gets.chomp                                           # menu
          when "a"
           human.search_weapon
          when "s"
            human.search_health_pack
          when "0"
             human.attacks(player1)
          when "1"
            human.attacks(player2)
          else 
            puts "t'as rien compris, tu perd un tour, et tu prend des degats !"
        end
      puts ""
        if player1.life_points > 0 || player2.life_points > 0
          puts "A ton tour d'en prendre plein la poire ! "
          print "..."
          gets.chomp
        end
        if player1.life_points >= 1                     # attaque des Players
           player1.attacks(human)
        end
        if player2.life_points >= 1
          player2.attacks(human)
        end
      end
        if human.life_points == 0
puts "                ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼                      # Affichage du game over
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
    end
      if player1.life_points <= 0 && player2.life_points <= 0                       # affichage de la fin en cas de Win
puts  " OOOO
OOOOOOOOO
OOOOOOOOOOOO
OOOOOOOOOOOOO
OOOOOOOOOOOOOO
OOOOOOOOOOOOOO
OOOOOOOOOOOOOO
OOOOOOOOOOOOOO
OOOOOOOOOOOOOO
 OOOOOOOOOOOOOO
 OOOOOOOOOOOOOO
 OOOOOOOOOOOOOO
 OOOOOOOOOOOOOO
  OOOOOOOOOOOOOO
  OOOOOOOOOOOOOO
  OOOOO /_/ |_|O
  OOOO  /  |/  \
  OOOO |o   |o  |
  O/c   |__/ --.
  O|_   ,     -'
   O|  '._______|
    |       _|
    |      |
    oooooooo
   /        \
"
      end
    end
  
    


landing
