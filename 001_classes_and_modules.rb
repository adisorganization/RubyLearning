# function
def hello

end

class Player
  # class method
  def self.hello
  end

  # instance method
  def hello
  end
end

ashwin = Player.new
ashwin.hello # instance method
Player.hello # class method

module Movable
  def self.walk
    puts "hello"
  end
end

Module.walk # => "hello"

class Player
  include Movable
end

ashwin.walk

class Player
  include Movable
  include Killable
  include Dancable
  include Scorable
end
