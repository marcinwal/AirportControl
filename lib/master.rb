require_relative 'atc'
require_relative 'plane'
require_relative 'airport'
#require_relative 'weather'





luton = Airport.new(airport_id: 1,capacity: 5)
stanstead = Airport.new(airport_id: 2,capacity: 5)

planes1 = 5.times.map{Plane.new(airport_id: 1)}
planes2 = 5.times.map{Plane.new(airport_id: 2)}

atc = ATC.new(gridx: 10, gridy: 10)

planes1.each {|pl| atc.add_plane(pl)}
planes2.each {|pl| atc.add_plane(pl)}
atc.add_airport(airport: luton, x: 3, y: 3)
atc.add_airport(airport: stanstead, x: 9, y: 7)

puts 'lets simulate'
input = gets.chomp
i = 0
while input != 'q'
  
  atc.check_for_landing_and_move
  puts "iteration number i #{i} in the air #{atc.in_the_air}"
  p atc

  input = gets.chomp
  system('clear')
  i += 1
end

