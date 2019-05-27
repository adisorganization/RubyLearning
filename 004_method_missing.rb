class Player
  def initialize
    @database = {
      ashwin: {
        score: 15342
      }
    }
  end

  def method_missing(m, *args, &block)  
    if @database.key?(m)
      puts @database[m][args[0]]
    else
      puts "player does not exist"
    end
  end
end

# database
player = Player.new
player.ashwin :score
