
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
#
















class Robot
$helmet_options = [":plastic is $20", ":bucket is $80", ":worldWar is $125",":angel is 400",":god is 700"]
$tool_options = [":screwdriver is 30",":woodenShieldis 90",":machineGun is 200",":godShield is 800"]
$helmets = {
:plastic => 20,
:bucket => 80,
:worldWar => 125,
:angel => 400,
:god => 700,

}
def ChooseHelmet()
@player_helmet
puts "Choose your robot's helmet"
puts $helmet_options
puts ""
@player_helmet = gets.chomp.to_sym
@player_helmet = $helmets[@player_helmet]
puts @player_helmet
return @player_helmet
end

$tools = {
"screwdriver" => 30,
"woodenShield" => 90,
"machineGun" => 200,
"godShield" => 800,

}

def ChooseTool
@player_tool
puts "Now choose your tool for battle"
puts $tool_options
puts ""
@player_tool = gets.chomp
@player_tool = $tools[@player_tool]
puts @player_tool
return

end

end

nickRobot = Robot.new

nickRobot.ChooseHelmet()
nickRobot.ChooseTool()
