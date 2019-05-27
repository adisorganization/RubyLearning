ismale = false
isfemale = false
istall = true

if ismale and istall
  puts "You are a tall male"
elsif ismale and !istall
  puts "You are a short male"
elsif !ismale and istall
  puts "You are not male but are tall"
else
  puts "You are either not male or not tall or both"
end



if isfemale
  puts "You are female"
else
  puts "You are not female"
end
