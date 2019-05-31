$current_credits = 1000
$helmet_options = [
  ":plastic is $20",
  ":bucket is $80",
  ":worldWar is $125",
  ":angel is $400",
  ":god is $700"
]
$tool_options = [
  ":screwdriver is $30",
  ":woodenShieldis $90",
  ":machineGun is $200",
  ":godShield is $800"
]

$player_helmets = {
:plastic => 20,
:bucket => 80,
:worldWar => 125,
:angel => 400,
:god => 700,

}

$toolsP = {
:screwdriver => 30,
:woodenShield => 90,
:machineGun => 200,
:godShield => 800,

}

$tools = [30, 90, 200, 800]
$helmets = [20, 80, 125, 400, 700]

#Robot health
$player_health = 100
$ai_robo_health = 100

#keep track of robot life state
$player_is_alive = true
$ai_is_alive = true

$minor_damage = 3
$dramatic_damage = 10

$worldWar_helmet_isselected = false
$angel_helmet_isselected = false

$worldWar_ai_helmet_isselected = false
$angel_ai_helmet_isselected = false

$attack

module Run_next_battle
  def self.choose_helmet_ai()
    random_helmet = rand(4)
    new_helmet = $helmets[random_helmet]
    if new_helmet == $helmets[0]
      puts "The helmet the AI has is plastic."
    elsif new_helmet == $helmets[1]
      puts "The helmet the AI has is bucket."
    elsif new_helmet == $helmets[2]
      puts "The helmet the AI has is worldwar."
    elsif new_helmet == $helmets[3]
      $worldWar_ai_helmet_isselected = true
      puts "The helmet the AI has is angel."
      $angel_ai_helmet_isselected = true
    elsif new_helmet == $helmets[4]
      puts "The helmet the AI has is god."
    end
  end

  def self.choose_tool_ai()
    random_tool = rand(3)
    new_tool = $tools[random_tool]
    if new_tool == $tools[0]
      puts "The tool the AI has is a screwdriver."
    elsif new_tool == $tools[1]
      puts "The tool the AI has is a wooden shield."
    elsif new_tool == $tools[2]
      puts "The tool the AI has is a machine gun."
    elsif new_tool == $tools[3]
      puts "The tool the AI has is god shield."
    end
  end

  def self.attack_ai()
    if $player_is_alive && $ai_is_alive
      if $worldWar_helmet_isselected
        $attack = rand(1..20) + $minor_damage
        $ai_robo_health -= $attack
      elsif $angel_helmet_isselected
        $attack = rand(1..20) + $dramatic_damage
        $ai_robo_health -= $attack
      else $attack = rand(1..20)
        $ai_robo_health -= $attack
      end

    puts "Player has attacked the opposing robot and now, its HP is #{$ai_robo_health}"
  else
      return
    end
      if $ai_robo_health < 0
        puts "Player has won the battle"
        $ai_is_alive = false
        return
      else
        #If AI is not destroyed, it shall attack player
        attack_player()
      end
  end

  def self.attack_player
    if $ai_is_alive && $player_is_alive
      if $worldWar_ai_helmet_isselected
        $attack = rand(1..20) + $minor_damage
        $player_health -= $attack
      elsif $angel_ai_helmet_isselected
        $attack = rand(1..20) + $dramatic_damage
        $player_health -= $attack
      else $attack = rand(1..20)
        $player_health -= $attack
      end
      puts "The opposing robot has attacked and now your HP is #{$player_health}"
    else
      return
    end
      if $player_health < 0
        puts "You have lost the battle"
        $player_is_alive = false
        return
      else
        attack_ai()
      end
    end
end
class Robot

  #This will be the link between both classes
  include Run_next_battle


  def choose_helmet
    @player_helmet
    puts "Choose your robot's helmet"
    #Display all helmet options to user
    puts $helmet_options
    puts ""
    @player_helmet = gets.chomp.to_sym
    #Assign helmet value
    @player_helmet = $player_helmets[@player_helmet]
    if @player_helmet == $player_helmets[:worldWar]
      worldWar_helmet_isselected = true
    elsif @player_helmet == $player_helmets[:angel]
      angel_helmet_isselected = true
    end
    #Deduct helmet value to current credits
    $current_credits -= @player_helmet
    puts "You now have #{$current_credits} credits left"
    return @player_helmet
  end



  def choose_tool
    $credit_checkpoint = $current_credits
    @player_tool
    puts "Now choose your tool for battle"
    puts $tool_options
    puts ""
    @player_tool = gets.chomp.to_sym
    @player_tool = $toolsP[@player_tool]
    $current_credits -= @player_tool
    #If the user does not have enough credits to purchase the item, ask to purchase another
    if $current_credits < 0
      puts "You don't have enough credits to make the purchase. Try something else"
      $current_credits = $credit_checkpoint
      choose_tool()

    else
      puts "You now have #{$current_credits} credits left"
      puts ""
      puts "Now the CPU opponent"
      choose_ai_armor()
      puts "Are you ready for battle?"
      answer = gets.chomp
        if answer == "yes" || answer == "Yes"
        battle_it_out()
        else
        $current_credits = $credit_checkpoint
        choose_tool()
        end
    end

  end


def choose_ai_armor
  Run_next_battle.choose_helmet_ai
  Run_next_battle.choose_tool_ai
end

def battle_it_out
  Run_next_battle.attack_ai
end




end #class

class Store
  #Link between both classes
  include Run_next_battle

  def battle_feedback
    feedback = [
      "That was a battle of the ages. Would you require of the shop for the next?",
      "I've seen better. Maybe try using the store for the next battle. So?",
      "That was quite the spectactle. Wanna get something from the store for the next?",
      "That was ok, but I know you can do better. Wanna see the store?",
    ]
    random_feedback = rand(3)
    aftermath_feedback = feedback[random_feedback]
    puts aftermath_feedback
    answer = gets.chomp
      if answer == "yes" || answer == "Yes" || answer == "YES"
      open_shop()
      else
      next_round()
      end
  end

  #This will show up when the user accesses the shop
  def open_shop
    puts "This is the shop"
    puts ""
    puts "Would you like to buy or sell?"
    answer = gets.chomp
    if answer == "buy" || answer == "Buy" || answer == "BUY"
      puts "Would you like to buy a Helmet or a Tool?"
      second_answer = gets.chomp
      if second_answer == "Helmet" || second_answer == "helmet"
        puts $helmet_options
      elsif second_answer == "Tool" || second_answer == "tool"
        puts $tool_options
      else
        puts "Sorry I didn't get that"
        try_again_buy()
        end
    elsif answer == "sell" || answer == "Sell" || answer == "SELL"
      puts "Would you like to sell a Helmet or a Tool?"
    end
  end



  def next_round
    Run_next_battle.choose_helmet_ai
    Run_next_battle.choose_tool_ai
    puts "Are you sure you are ready for battle?"
    answer = gets.chomp
    if answer == "yes" || answer == "Yes"
      if !$player_is_alive
        player_is_alive = true
        Run_next_battle.attack_ai
      elsif !$ai_is_alive
        $ai_is_alive = true
        Run_next_battle.attack_ai
      end

    else
      open_shop()
    end
  end

  def try_again_buy

      puts "Would you like to buy a Helmet or a Tool?"
      second_answer = gets.chomp
      if second_answer == "Helmet" || second_answer == "helmet"
        puts $helmet_options
      elsif second_answer == "Tool" || second_answer == "tool"
        puts $tool_options
      else
        puts "Sorry I didn't get that"
        try_again()
      end
  end

end#class


#RUN PROGRAM
nickRobot = Robot.new
store = Store.new
puts "Welcome warrior, you have been given 1000 credits "
puts ""
nickRobot.choose_helmet()
puts ""
nickRobot.choose_tool()

puts ""

puts ""
#Once robots are setup, they must attack

#Open the store once the battle is over
puts ""
store.battle_feedback()
