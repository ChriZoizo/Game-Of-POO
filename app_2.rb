require 'bundler'
require 'pry'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

def landing
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
|>               -----------------------------------------------              <|"
puts ""
puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  PRESS 'ENTER' TO PLAY  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
puts "=============================================> START? <==============================================="
puts ""
         ok = gets.chomp  
         SpinningCursor.run do
          banner "LOADING..."
          type :spinner
          action do
          sleep 5
  end
          message "LOADED !"
  end

  puts "Bonjour a toi mecreant !! Quel est ton nom ? (ducon)"
  print ">"
  player_name = gets.chomp.to_s
  human = HumanPlayer.new(player_name)

  @arr_player = []
  @arr_player << player1 = Player.new("Prout")
  @arr_player << player2 = Player.new("Pouet")

  while human.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts ""
puts "<3<3<3    Voici l'etat des ennemis    <3<3<3"
puts ""
player1.show_state
player2.show_state
puts ""
puts "<3<3<3        Voici ton etats         <3<3<3"
puts ""
human.show_state
puts "Quelle action veux-tu effectuer ?"
puts ""
puts "a - chercher de quoi leurs cassé la bouche"
puts "s - chercher à se soigner (pas sur que tu trouve ^^)"
puts ""
puts "attaquer un joueur en vue :"
if player1.life_points > 0
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
case gets.chomp
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

@arr_player.each do |enemy| # Les ennemis attaquent l'utilisateur chacun leur tour tant qu'il est en vie, sinon un message annonce sa mort
  if enemy.life_points > 0
enemy.attacks(human)
  end
  if human.life_points <= 0
    puts "                ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼
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
  end
end
end
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
