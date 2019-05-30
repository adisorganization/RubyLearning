class Robot

$current_credits = 1000
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
#Display all helmet options to user
puts $helmet_options
puts ""
@player_helmet = gets.chomp.to_sym
#Assign helmet value
@player_helmet = $helmets[@player_helmet]
#Deduct helmet value to current credits
$current_credits -= @player_helmet
puts "You now have #{$current_credits} credits left"
return @player_helmet
end

$tools = {
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
@player_tool = $tools[@player_tool]
$current_credits -= @player_tool
#If the user does not have enough credits to purchase the item, ask to purchase another
if $current_credits < 0
  puts "You don't have enough credits to make the purchase. Try something else"
  $current_credits = $credit_checkpoint
 return ChooseTool()
end
puts "You now have #{$current_credits} credits left"
return

end

end

nickRobot = Robot.new
puts "Welcome warrior, you have been given 1000 credits"
puts ""
nickRobot.ChooseHelmet()
puts ""
nickRobot.ChooseTool()
