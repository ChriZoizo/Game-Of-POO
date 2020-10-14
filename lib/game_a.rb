require_relative 'player'
class Game < HumanPlayer
  attr_accessor :human_player, :enemies_in_sight
puts   
puts "Combien d'adversaire ?"
print ">> "
enemies_number = gets.chomp.to_i
@Player_left = enemies_number
$enemies_in_sight

def initialize
  super(name)
  $enemies_in_sight = Array.new
  $enemies_in_sight << @player1 = Player.new('IronMan')
  $enemies_in_sight << @player2 = Player.new('Cpt.America')
  $enemies_in_sight << @player3 = Player.new('Pouet')
  $enemies_in_sight << @player4 = Player.new('Prout')
   puts puts "Bonjour a toi mecreant !! Quel est ton nom ?"
   print ">"
  n = gets.chomp.to_s
  @human = HumanPlayer.new(n)
end

def kill
  $enemies_in_sight.each do |id, life, name|
    if life == 0
      $enemies_in_sight.delete(name)
    end
  end
end

def is_still_on_going?
  if $enemies_in_sight == nil || @human.life_points <= 0
    return false
  else
    return 
  end
end

def show_players_states
  $enemies_in_sight.each do |cpu|
    cpu.show_state
  end
end

def show_players
  num = $enemies_in_sight.count
  puts "___________________
|Il reste #{num} bots. |
'-----------------'"
  @human.show_state
end

def menu 
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

  i = 0
  $enemies_in_sight.each do |cpu|
  i +=1 
  puts "#=>#{i} #{cpu.name}"
  puts cpu.show_state
    puts "#=> 1 #{@player1.name}"
  puts @player1.show_state
  puts "#=> 2 #{@player2.name}"
  puts @player2.show_state
  puts "#=> 3 #{@player3.name}"
  puts @player3.show_state
  puts "#=> 4 #{@player4.name}"
  puts @player4.show_state
  end
end

def menu_choice
  puts "--------------------------------------------------------------------------"
  print ">>>>>>>>>>>>> Choisissez une action <<<<<<<<<<<<<"
  puts ""
  input = gets.chomp
    if input == "w"
    @human.search_weapon
  end

    if input == "s"
  @human.search_health_pack
  end

  n=0
    $enemies_in_sight.each do | cpu |
     n +=1 
      if input = n
      @human.attacks(cpu)
      @human.attacks(cpu)
    end
  end

  puts "t'as rien compris!  tu perd un tour, et tu prend des degats ! (et v'la les degats)"
end


def new_players_in_sight
  @dice = rand (1..6)
  $name_cpu = ["Francise", "Macron", "Superman", "Guts", "Florian", "Ugo", "Killian", "Johnathan", "David", "Jean-Marc", "Guillemette XD", "Sindy", "Moncul", "Sur la Commode", "Fhelix le mou", "Rose", "Jiiha", "Robert"]
  case @dice
      
    when 1
        puts "Chanceux(se) ! tu as esquivé les ennemies apparement"
      
    when 2..4 
       nb = rand (1..1000000)
      $new_player = "player#{nb}"   
      $enemies_in_sight << $new_player=Player.new($name_cpu.sample)
     puts "1 nouvel emmerdeur arrive !!"
      
    when 5..6
      2.times do
        nb = rand (1..1000)
        $new_player = "player#{nb}"   
        $enemies_in_sight << $new_player=Player.new($name_cpu.sample)
       puts "2 nouveaux emmerdeur arrive !!"
      end
  end
end


def ennemies_attack
  $enemies_in_sight.each do |cpu|
    cpu.attacks(@human)
  end
end

def end_game
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

