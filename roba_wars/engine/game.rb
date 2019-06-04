class Game
  def initialize
  end

  def start
    @state = :start
    @running = true
    while @running do
      input = gets.chomp
      if input == "exit"
        self.exit_game
      else
        case @state
        when :start then self.welcome
        when :helmet then self.choose_helmet
      end

    end
  end

  def exit_game
    puts "goodbye"
    @running = false
  end

  def welcome
    puts "Welcome to RobaWar"
    @state = :helmet
  end

  def choose_helmet

  end

end #class
