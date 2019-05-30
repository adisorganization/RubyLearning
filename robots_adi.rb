$robot1_health = 100
$robot2_health = 100

def robot1_actions
  if $robot1_health > 0
    puts "Robot 1 will now attack. Do you wish to continue? (y/n)"
    response = gets.chomp
      if response == "n"
        puts "game ended."
      elsif response == "y"
        damage = rand(100)
        $robot2_health = $robot2_health - damage
        puts "Robot 1 has dealt " + damage.to_s + " damage."
        puts "Robot 2 has " + $robot2_health.to_s +  " health remaining."
        robot2_actions
      end
  else
    puts "Robot 1 has been defeated. Robot 2 wins."
  end
end


def robot2_actions
  if $robot2_health > 0
    puts "Robot 2 will now attack. Do you wish to continue? (y/n)"
    response = gets.chomp
      if response == "n"
        puts "game ended."
      elsif response == "y"
        damage = rand(100)
        $robot1_health = $robot1_health - damage
        puts "Robot 2 has dealt " + damage.to_s + " damage."
        puts "Robot 1 has " + $robot1_health.to_s + " health remaining."
        robot1_actions
      end
  else
    puts "Robot 2 has been defeated. Robot 1 wins."
  end
end

robot1_actions
