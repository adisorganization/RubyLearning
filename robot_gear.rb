$current_credits = 1000
$helmet_options = [
  ":plastic costs $20. Grants you +25 hp.",
  ":bucket is $80. Grants you +50 hp.",
  ":worldWar is $125. Grants you +10 damage.",
  ":angel is $400. Grants you +20 damage.",
  ":god is $700. Grants you +100 hp."
]
$tool_options = [
  ":screwdriver is $30. Grants you +10 damage",
  ":woodenShieldis $90. Grants you +50 hp.",
  ":machineGun is $200. Grants you +20 damage.",
  ":godShield is $800. Grants you +100 hp."
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

$minor_damage_buff = 10
$major_damage_buff = 20

$minor_health_buff = 25
$medium_health_buff = 50
$major_health_buff = 100

$plastic_helmet_isslected = false
$bucket_helmet_isselected = false
$worldWar_helmet_isselected = false
$angel_helmet_isselected = false
$god_helmet_isselected = false

$screwdriver_isselected = false
$wooden_shield_isselected = false
$machine_gun_isselected = false
$godShield_isselected = false

$plastic_ai_helmet_isslected = false
$bucket_ai_helmet_isselected = false
$worldWar_ai_helmet_isselected = false
$angel_ai_helmet_isselected = false
$god_ai_helmet_isselected = false

$screwdriver_ai_isselected = false
$wooden_shield_ai_isselected = false
$machine_gun_ai_isselected = false
$godShield_ai_isselected = false
$attack

class Robot


  def choose_helmet
    @player_helmet
    puts "Choose your robot's helmet"
    #Display all helmet options to user
    puts $helmet_options
    puts ""
    @player_helmet = gets.chomp.to_sym
    #Assign helmet value
    @player_helmet = $player_helmets[@player_helmet]
    if @player_helmet == $player_helmets[:plastic]
      $plastic_helmet_isslected = true
      $player_health += $minor_health_buff
    elsif @player_helmet == $player_helmets[:bucket]
      $bucket_helmet_isselected = true
      $player_health += $medium_health_buff
    elsif @player_helmet == $player_helmets[:worldWar]
      $worldWar_helmet_isselected = true
    elsif @player_helmet == $player_helmets[:angel]
      $angel_helmet_isselected = true
    elsif @player_helmet == $player_helmets[:god]
      $god_helmet_isselected = true
      $player_health += $major_health_buff
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
    if @player_tool == $toolsP[:screwdriver]
      $screwdriver_isselected = true
    elsif @player_tool == $toolsP[:woodenShield]
      $wooden_shield_isselected = true
      $player_health += $medium_health_buff
    elsif @player_tool == $toolsP[:machineGun]
      $machine_gun_isselected = true
    elsif @player_tool == $toolsP[:godShield]
      $godShield_isselected = true
      $player_health += $major_health_buff
    end
    $current_credits -= @player_tool
    #If the user does not have enough credits to purchase the item, ask to purchase another
    if $current_credits < 0
      puts "You don't have enough credits to make the purchase. Try something else"
      $current_credits = $credit_checkpoint
      choose_tool()
    end
    puts "You now have #{$current_credits} credits left"
  end



  def choose_helmet_ai()
    random_helmet = rand(4)
    new_helmet = $helmets[random_helmet]
    if new_helmet == $helmets[0]
      puts "The helmet the AI has is plastic."
      $ai_robo_health += $minor_health_buff
    elsif new_helmet == $helmets[1]
      puts "The helmet the AI has is bucket."
      $ai_robo_health += $medium_health_buff
    elsif new_helmet == $helmets[2]
      puts "The helmet the AI has is worldwar."
    elsif new_helmet == $helmets[3]
      $worldWar_ai_helmet_isselected = true
      puts "The helmet the AI has is angel."
      $angel_ai_helmet_isselected = true
    elsif new_helmet == $helmets[4]
      puts "The helmet the AI has is god."
      $ai_robo_health += $major_health_buff
    end
  end


  def choose_tool_ai()
    random_tool = rand(3)
    new_tool = $tools[random_tool]
    if new_tool == $tools[0]
      puts "The tool the AI has is a screwdriver."
    elsif new_tool == $tools[1]
      puts "The tool the AI has is a wooden shield."
      $ai_robo_health += $medium_health_buff
    elsif new_tool == $tools[2]
      puts "The tool the AI has is a machine gun."
    elsif new_tool == $tools[3]
      puts "The tool the AI has is god shield."
      $ai_robo_health += $major_health_buff
    end
  end

def attack_ai()
  if $player_is_alive && $ai_is_alive
    if $worldWar_helmet_isselected
      $attack = rand(1..20) + $minor_damage_buff
      $ai_robo_health -= $attack
    elsif $angel_helmet_isselected
      $attack = rand(1..20) + $major_damage_buff
      $ai_robo_health -= $attack
    end
    if $screwdriver_isselected
      $attack = rand(1..20) + $minor_damage_buff
      $ai_robo_health -= $attack
    elsif $machine_gun_isselected
      $attack = rand(1..20) + $major_damage_buff
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

def attack_player
  if $ai_is_alive && $player_is_alive
    if $worldWar_ai_helmet_isselected
      $attack = rand(1..20) + $minor_damage_buff
      $player_health -= $attack
    elsif $angel_ai_helmet_isselected
      $attack = rand(1..20) + $major_damage_buff
      $player_health -= $attack
    end
    if $screwdriver_ai_isselected
      $attack = rand(1..20) + $minor_damage_buff
      $player_health -= $attack
    elsif $machine_gun_ai_isselected
      $attack = rand(1..20) + $major_damage_buff
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

end #class


nickRobot = Robot.new
adiRobot = Robot.new
puts "Welcome warrior, you have been given 1000 credits /n"

nickRobot.choose_helmet()
puts ""
nickRobot.choose_tool()
puts "Now the CPU opponent"
adiRobot.choose_helmet_ai()
adiRobot.choose_tool_ai()

#Once robots are setup, they must attack
nickRobot.attack_ai()
