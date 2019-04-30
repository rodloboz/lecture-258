require_relative "patient"
require_relative "room"

room = Room.new({
  number: 303,
  capacity: 2
})

paul = Patient.new({
  name: "Paul",
  age: 33
})

puts "Before adding patient..."
p room

room.add_patient(paul)

puts "After adding patient..."
p room

mary = Patient.new({
  name: "Mary",
  age: 23
})

room.add_patient(mary)

peter = Patient.new({
  name: "Peter",
  age: 12
})

begin
  room.add_patient(peter)
rescue Room::CapacityExeededException
  puts "You can't add any more patients!! The room is full!"
end

p room

puts "Goodbye!"






