require "pry"
#require_relative "./engine/game"
require_relative "./engine/run_next_battle"
require_relative "./engine/store"
require_relative "./engine/robot"

$current_credits = 1000
$penalty = 100
$reward = 200
$helmet_options = [
  ":plastic is $20",
  ":bucket is $80",
  ":worldWar is $125",
  ":angel is $400",
  ":god is $700"
]
$tool_options = [
  ":screwdriver is $30",
  ":woodenShield is $90",
  ":machineGun is $200",
  ":godShield is $800"
]

$player_helmets = {
:plastic => 20,
:bucket => 80,
:worldWar => 120,
:angel => 420,
:god => 700,

}

$toolsP = {
:screwdriver => 30,
:woodenShield => 120,
:machineGun => 300,
:godShield => 840,

}

$tools = [30, 90, 200, 800]
$helmets = [20, 80, 125, 400, 700]

#Damaged part
$damaged = rand(1..2)
#Damaged Once
$helmet_isdamaged = false
$tool_isdamaged = false
#Damaged twice
$helmet_isdestroyed = false
$tool_isdestroyed = false

#Robot health
$player_health = 100
$ai_robo_health = 100
$max_health = 100

#keep track of robot life state
$player_is_alive = true
$ai_is_alive = true

#Some items will give the robots more damage or health
$minor_damage = 3
$dramatic_damage = 10

$minor_health = 25
$medium_health = 50
$major_health = 100

#Keep track of currrent merchandise to affect stats
$plastic_helmet_isslected = false
$bucket_helmet_isselected = false
$worldWar_helmet_isselected = false
$angel_helmet_isselected = false
$god_helmet_isselected = false

$screwdriver_isselected = false
$wooden_shield_isselected = false
$machine_gun_isselected = false
$godShield_isselected = false

#Current merch for ai-gen

#0 -> plastic, 1-> bucket, 2-> worldWar, 3 -> angel, 4-> god
$ai_helmets = [false , false, false, false, false]
#0 -> screwdriver, 1-> wood, 2 -> machinegun, 3-> godshield
$ai_tools = [false, false, false, false]




$attack = rand(1..20)




#RUN PROGRAM
# game = Game.new
# game.start
puts "Welcome warrior, you have #{$current_credits} credits\n"
robot = Robot.new
robot.choose_helmet


#Once robots are setup, they must attack

#Open the store once the battle is over
