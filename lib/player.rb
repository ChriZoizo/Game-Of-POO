class Player                                          # creation de classe Player (CPU)
  attr_accessor :name, :life_points :p_name
  def initialize(name)                                # Methode qui definis les caracteristiques des objets Player  
    $name_cpu = ["prout", "pouet", "Francise", "Macron", "Superman", "Guts", "Florian", "Ugo", "Killian", "Johnathan", "David", "Jean-Marc", "Guillemette XD", "Sindy", "Moncul", "Sur la Commode", "Fhelix le mou", "Rose", "Jiiha", "Robert"]
    @name = $name_cpu.sample                          # L'array sert de reserve de noms pour les I.A.
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
 
  def compute_damage                                  # methode pour laculer la valeur des degats
      
    return rand(1..6)
  end
end

def cpu_name
  $name_cpu = ["prout", "pouet", "Francise", "Macron", "Superman", "Guts", "Florian", "Ugo", "Killian", "Johnathan", "David", "Jean-Marc", "Guillemette XD", "Sindy", "Moncul", "Sur la Commode", "Fhelix le mou", "Rose", "Jiiha", "Robert"]
$cpu_name = $name_cpu.sample
end


class HumanPlayer < Player                           #Creation de la Class HumanPlayer pour le joueur
  attr_accessor :weapon_level                        
  def initialize(p_name)                               
    super(name)
    @life_points = 100
    @weapon_level = 0
  end

  def show_state                                    # Affiche le status e status du joueurs
    p "#{name} a #{@life_points} PV et un arme Level #{weapon_level}"
  end

  def compute_damage                                # Calcule les degats pour le joueur. avec coefficient multiplicateur
    rand(1..6) * @weapon_level                      # qui correspond au resultat de la methode search_weapon
  end

  def search_weapon                                 # Methode pour le cas ou le joueur
    @weapon_find = rand(1..6)                       # calcule de lu niveau de l'arme trouver
    puts "Tu as trouvé un arme de niveau #{@weapon_find} !"
     print "..."
     l = gets.chomp
    if @weapon_find > @weapon_level                 # condition pour le cas ou l'arme est moin puissant que l'arme actuelle
      @weapon_level += @weapon_find
    else 
      puts "#tristesse ! elle n'est pas mieux quel ton arme actuel !"
      print "..."
      l = gets.chomp
    end
    end

  def search_health_pack                            # methode pour chercher un kit de soin
    medipack = rand(1..6)                           # valeur du kit de soin
    case medipack                                   
    when 1                                          # le cas ou le jet de des donne 1
      puts " tu n'as rien trouvé :'( fout le camp !"
      print "..."
      l = gets.chomp
    when 2..5                                       # Cas ou le joueur trouve un medipack de 50
          puts "Bravo ! tu as recuperé un medipack (50PV)"    
          if @life_points <50                       # Application du soin
           @life_points+=50
          else 
            @life_points = 100
          end
          print "..."
          l = gets.chomp
          when 6                                    # cas ou le joueur trouve un medipack de 80
            puts "Bravo ! t'es content ? t'as recuperé un grand medipack (80PV)"
            if @life_points < 20                    # Application du soin                             
              @life_points +=80
            else 
              @life_points = 100
            end
print "..."                                         # temporisation
l = gets.chomp
 
      end
    end
  end



