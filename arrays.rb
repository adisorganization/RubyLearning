#Create and modify a loaded array
friends = Array["Jacob", "Nick", "Eric"]
puts friends[0]
puts friends[-1]
puts friends[0,2]
puts friends.length
puts friends.include?("Richard")
puts friends.sort
puts friends.reverse

friends[0] = "Johnny"
puts friends[0]

#create and modify an empty array
otherFriends = Array.new
otherFriends[0] = "Joseph"
otherFriends[1] = "Powel"
puts otherFriends
