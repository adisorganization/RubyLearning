$var_hello = 'from everywhere'
VAR_HELLO = 'from most places'
var_hello = 'no where bud'

def say_hello passed_hello
  var_fun_hello = 'only from var'
  puts $var_hello
  puts VAR_HELLO
  puts passed_hello
  puts var_hello
end

#say_hello(var_hello)

# @@ = class variable
# @ instance variable
class Player
  @@var_hello = 'testing'

  def self.say_hello
    puts @@var_hello
  end

  def walk!
    @state = 'waking'
  end

  def get_state
    puts @state
  end
end

Player.say_hello
ashwin = Player.new
ashwin.walk!
ashwin.get_state
