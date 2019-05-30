class Robot
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

end

nickRobot = Robot.new

nickRobot.ChooseHelmetAi()
nickRobot.ChooseToolAi()
