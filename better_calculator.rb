def infinite_operator ()
  puts "Enter a number"
  first_number = gets.to_f
  puts "Enter a second number"
  second_number = gets.to_f
  operators = Array[1,2,3,4]
puts "Choose your operator"
chosen_number = gets.to_i

if operators[0] == chosen_number
  puts first_number + second_number
  infinite_operator()
elsif operators[1] == chosen_number
  puts first_number - second_number
  infinite_operator()
elsif operators[2] == chosen_number
  puts first_number / second_number
  infinite_operator()
elsif operators[3] == chosen_number
  puts first_number * second_number
  infinite_operator()
else
  puts first_number % second_number
  infinite_operator()
end
end
infinite_operator()
