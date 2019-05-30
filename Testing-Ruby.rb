
# class Robots
#   @@maxHealth
#   @@currentHealth
#   def self.Attack()
#     attack = rand(1..20)
#     currentHealth -= attack
#   end
#
#   def self.Health(tempHealth)
#     maxHealth = tempHealth
#     currentHealth = maxHealth
#     puts currentHealth
#     if currentHealth <= 0
#       puts "Robot has died, because his battery has reached #{currentHealth}"
#     else
#       Attack()
#       puts "Robot has just attacked"
#     end
#   end
# end
#
#   robot1 = Robots.new
#   robot2 = Robots.new
#
#   robot1.Health(200)
#   robot1.Attack
#
#   robot2.Health(300)
#   robot2.Attack
$robot1_health = 100
$robot2_health = 100
$dead = 0

$can_keep_attacking1 = true
$can_keep_attacking2 = true
$robot1_died = false
$robot2_died = false


def Robot1()
  if !$robot1_died && !$robot2_died
  #Set a random attack
  attack = rand(1..20)
  #Opposing robot loses health
  $robot2_health -= attack
  puts "Robo 2 health is #{$robot2_health}"
else
  return
end
  #Destroy robot if health is too low. else keep attacking
  if $robot2_health < $dead
    $can_keep_attacking2 = false
    $robot2_died = true
    puts "Target2 has been eliminated and robot1 wins"
    return
  elsif $robot2_health > $dead && $can_keep_attacking2
    return Robot2()
  end
end

def Robot2()
  if !$robot2_died && !$robot1_died
  attack = rand(1..25)
  $robot1_health -= attack
  puts "Robo 1 health is #{$robot1_health}"
else
  return
end
  if $robot1_health < $dead
    $can_keep_attacking1 = false
    $robot1_died = true
    puts "Target1 has been eliminated and robot 2 wins"
   return
  elsif $robot1_health > $dead && $can_keep_attacking1
    return Robot1()
  end
end

Robot1()
Robot2()
