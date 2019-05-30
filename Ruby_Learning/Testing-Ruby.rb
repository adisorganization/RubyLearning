class Robot

$current_credits = 1000
$helmet_options = [":plastic is $20", ":bucket is $80", ":worldWar is $125",":angel is 400",":god is 700"]
$tool_options = [":screwdriver is 30",":woodenShieldis 90",":machineGun is 200",":godShield is 800"]

$helmetsP = {
:plastic => 20,
:bucket => 80,
:worldWar => 125,
:angel => 400,
:god => 700,

}
def ChooseHelmet()
@player_helmet
puts "Choose your robot's helmet"
#Display all helmet options to user
puts $helmet_options
puts ""
@player_helmet = gets.chomp.to_sym
#Assign helmet value
@player_helmet = $helmetsP[@player_helmet]
#Deduct helmet value to current credits
$current_credits -= @player_helmet
puts "You now have #{$current_credits} credits left"
return @player_helmet
end

$toolsP = {
:screwdriver => 30,
:woodenShield => 90,
:machineGun => 200,
:godShield => 800,

}

def ChooseTool
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
  ChooseTool()
end
puts "You now have #{$current_credits} credits left"

end



$tools = [30, 90, 200, 800]
$helmets = [20, 80, 125, 400, 700]


def ChooseHelmetAi()
random_helmet = rand(4)
new_helmet = $helmets[random_helmet]
if new_helmet == $helmets[0]
  puts "The helmet the AI has is plastic."
elsif new_helmet == $helmets[1]
  puts "The helmet the AI has is bucket."
elsif new_helmet == $helmets[2]
  puts "The helmet the AI has is worldwar."
elsif new_helmet == $helmets[3]
  puts "The helmet the AI has is angel."
elsif new_helmet == $helmets[4]
  puts "The helmet the AI has is god."
end
end

def ChooseToolAi()
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


nickRobot = Robot.new
adiRobot = Robot.new
puts "Welcome warrior, you have been given 1000 credits /n"

nickRobot.ChooseHelmet()
puts ""
nickRobot.ChooseTool()
puts "Now the CPU opponent"
adiRobot.ChooseHelmetAi()
adiRobot.ChooseToolAi()
