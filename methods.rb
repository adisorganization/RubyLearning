def greetUser
  puts "Welcome"
end

def sayName(name, age)
  puts ("Your name is " + name + ". You are " + age.to_s + " years old.")
end

puts "top"
greetUser
sayName("Adi", 19)
puts "bottom"
