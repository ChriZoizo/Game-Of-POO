require_relative 'player' 
                             
class Game < HumanPlayer                                       # appel le fichier player                             
  attr_accessor :human_player, :enemies

def initialize
  super(name)                                                  #creation des Player_CPU
  $enemies = Array.new
  $enemies << @player1 = Player.new('IronMan')
  $enemies << @player2 = Player.new('Cpt.America')
  $enemies << @player3 = Player.new('Pouet')
  $enemies << @player4 = Player.new('Prout')

puts puts "Bonjour a toi mecreant !! Quel est ton nom ?"        # Creation du joueurs
print ">"
n = gets.chomp.to_s
@human = HumanPlayer.new(n)
end

def kill                                                        # Verification et retrait des Players mort de l'array
  $enemies.each do |id, life, name|                             # Si les PV de l'ennemi arrive a 0, il est effacé
    if life == 0
      $enemies.delete(name)
    end
  end
end

def is_still_on_going?                                          # verification de l'etats de la partie
  if $enemies.count != 0 && @human.life_points > 0                 # si le joueurs arrive a 0 PV ou que l'array
  return true                                                  # ou si il n'y a plus de Players_CPU
  else
   return false
   
  end
end

def show_players_states                                         # pour montrer l'etats des Players contenus dans l'array
  $enemies.each do |cpu|
    cpu.show_state
  end
end

def show_players                                                # Pour montrer combien de Players_CPU il reste
  num = $enemies.count                                          # Ainsi que l'etats du joueur
    puts "___________________
|Il reste #{num} bots. |
'-----------------'"
@human.show_state
end

def menu                                                         #ça c'est l'affichage des menus
  puts ""
puts "†:.｡.:ﾟ:.｡.:†:.｡.:ﾟ:.｡.:†:.｡.:ﾟ:.｡.:†:.｡.:ﾟ:.｡.:†:.｡.:ﾟ:.｡.:†:.｡.:ﾟ:.｡.:†:.｡.:ﾟ:.｡.:†"
puts ""
puts "Quelle action veux-tu effectuer ?"
puts ""
puts "   >>>>>>> SUPPORT <<<<<<<"
puts "#~> a - chercher de quoi leurs cassé la bouche"
puts "#~> s - chercher à se soigner (pas sûr que tu trouve ^^)"
puts "   >>>>>>> ATTAQUE <<<<<<<"
puts "attaquer un joueur en vue :"
puts ""
if @player1.life_points > 0
puts "#=> 1 "
puts @player1.show_state
end
if @player2.life_points > 0
puts "#=> 2 "
puts @player2.show_state
end
if @player3.life_points > 0
puts "#=> 3 "
puts @player3.show_state
end
if @player4.life_points > 0
puts "#=> 4 "
puts @player4.show_state
end
end

def menu_choice                                                     # methode pour interpreté les commandes
  puts "--------------------------------------------------------------------------"
print ">>>>>>>>>>>>> Choisissez une action <<<<<<<<<<<<<"           # et interagire avec le menu
puts ""
case gets.chomp
when "a"
  @human.search_weapon
when "s"
  @human.search_health_pack
when "1"
  @human.attacks(@player1)
when "2"
  @human.attacks(@player2)
when "3"
  @human.attacks(@player3)
when "4"
  @human.attacks(@player4)
else 
  puts "t'as rien compris!  tu perd un tour, et tu prend des degats ! (et v'la les degats)"
end                                                                  #Si le joueur n'appuie pas sur la bonne touche, il perd un tour
end

def ennemies_attack                                                  # Parcoure l'array contenant les players_CPU et les fait attaqué le joueur
  $enemies.each do |cpu|
    if cpu.life_points >0
    cpu.attacks(@human)
    else
    end
  end
end

def end_game                                                         # Affichage du game over en fin de partie
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

end
end

