
class Player                                          # creation de classe Player (CPU)
  attr_accessor :name, :life_points
  def initialize(name)                                # Methode qui definis les caracteristiques des objets Player  
    @name = name.to_s
    @life_points = 10
  end

  def show_state                                      # pour montrer l'etats d'un Player_CPU / Joueurs
    puts "#{name} a #{@life_points} PV"
  end

  def get_damage(damage)                              # Methode qui va appliquer les dommage sur les PV de la cible
    @life_points -= damage
    if @life_points <= 0                              # si les PV de la cible sont en dessous ou egal a 0
      puts "Le joueurs #{name} a ete fumé !"          # un joli Ascii ^^
               puts "	                                
                                     ____
                              __,---'     `--.__
                           ,-'                ; `.
                          ,'                  `--.`--.
                         ,'                       `._ `-.
                         ;                     ;     `-- ;
                       ,-'-_       _,-~~-.      ,--      `.
                       ;;   `-,;    ,'~`.__    ,;;;    ;  ;
                       ;;    ;,'  ,;;      `,  ;;;     `. ;
                       `:   ,'    `:;     __/  `.;      ; ;
                        ;~~^.   `.   `---'~~    ;;      ; ;
                        `,' `.   `.            .;;;     ;'
                        ,',^. `.  `._    __    `:;     ,'
                        `-' `--'    ~`--'~~`--.  ~    ,'
                       /;`-;_ ; ;. /. /   ; ~~`-.     ;
-._                   ; ;  ; `,;`-;__;---;      `----'
   `--.__             ``-`-;__;:  ;  ;__;
 ...     `--.__                `-- `-'
`--.:::...     `--.__                ____
    `--:::::--.      `--.__    __,--'    `.
        `--:::`;....       `--'       ___  `.
            `--`-:::...     __             ;
                  ~`-:::...   `---.      | ,'
                      ~`-:::::::::`--.   `-.
                          ~`-::::::::`.    ;
                              ~`--:::,'   ,'"
      @life_points = 0                                # Juste au cas ou, pour s'assurer que les PV sont a zero et pas en negatifs
    end
  end

  def attacks(target)                                               # Protocol d'attaque
    puts ""     
    puts "le joueurs #{name} attaque le #{target.name}"               # annonce l'attaquant et la cible

    damage = compute_damage                                           # 
    puts ""
    puts "=)----  #{name} inflige #{damage} points de dommage(s)"
    target.get_damage(damage)
  end
 
  def compute_damage
      return rand(1..6)
  end
end


class HumanPlayer < Player
  attr_accessor :weapon_level
  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    p "#{name} a #{@life_points} PV et un arme Level #{weapon_level}"
  end

  def compute_damage 
    rand(1..6) * @weapon_level
  end

  def search_weapon
    @weapon_find = rand(1..6)
    puts "Tu as trouvé un arme de niveau #{@weapon_find} !"
     print "..."
     l = gets.chomp
    if @weapon_find > @weapon_level 
      @weapon_level += @weapon_find*
    if @weapon_level = 7
      @weapon_level = 6
    else 
      puts "#tristesse ! elle n'est pas mieux quel ton arme actuel !"
      print "..."
      l = gets.chomp
    end
    end

  def search_health_pack
    medipack = rand(1..6)
    case medipack
    when 1
      puts " tu n'as rien trouvé :'( fout le camp !"
      print "..."
      l = gets.chomp
    when 2..5
          puts "Bravo ! tu as recuperé un medipack (50PV)"
          if @life_points <50
           @life_points+=50
          else 
            @life_points = 100
          end
          print "..."
          l = gets.chomp
          when 6
            puts "Bravo ! t'es content ? t'as recuperé un grand medipack (80PV)"
            if @life_points < 20 
              @life_points +=80
            else 
              @life_points = 100
            end
print "..."
l = gets.chomp
 
      end
    end
  end
end

