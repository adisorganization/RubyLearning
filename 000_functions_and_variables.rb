string  = 'string'
number  = 123
float   = 1.23
symbol  = :symbol
boolean = true
is_null = nil

# assign if variable is nil

if x == nil
  x = 1
end

if x.nil?
  x = 1
end

x = 1 if x.nil?

x = 1 unless x

x ||= 1

# if y is true than x = 1
# else x = 2
#

if y
  x = 1
else
  x = 2
end

x =
if y
  1
else
  2
end

x =
if y then 1
else; 2
end

# same line
if y; x = 1; else; x =2; end

# ternary operator
y ? x = 1 : x = 2

x = y ? 1 : 2


# another way
x = 2
x = 1 if y

array = [1,2,3,4,5]
array.first
array.last
array.at(2)
array.index(4)


hash = {
  "player1" =>  "Cloud"
  "player2" =>  "Tifa"
  "player3" => "Barret"
  "player4" => "Red XII"
}

hash["player3"]

hash = {
  :player1 =>  "Cloud",
  :player2 =>  "Tifa",
  :player3 => "Barret",
  :player4 => "Red XII"
}

hash = {
  player1:  "Cloud",
  player2:  "Tifa",
  player3: "Barret",
  player4: "Red XII"
}
