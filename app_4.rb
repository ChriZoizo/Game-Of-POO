require 'bundler'
require 'pry'
require 'spinning_cursor'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/game_a'

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
          ok = gets.chomp  
          
SpinningCursor.run do
        banner "LOADING..."
        type :spinner
        action do
        sleep 5
end
        message "LOADED !"
end



@my_game = Game.new


nb_enemies = $enemies_in_sight.count
 while nb_enemies >0 do
@my_game.show_players
puts "--------------------------------------------------"
@my_game.show_players_states
@my_game.menu
@my_game.menu_choice
@my_game.ennemies_attack
@my_game.kill
@my_game.new_players_in_sight
end

@my_game.end_game  

  

end

# def this_is_end?
# if 
#   game_begin
# else
# end_game
# end
# end
# end






landing


