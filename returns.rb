def cube(num)
  return num * num * num, 70, "return this"
  puts "hello" #line will not be printed because of the "return"
end

puts cube(2)[0,3]
