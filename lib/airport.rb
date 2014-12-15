require_relative 'weather.rb'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10  

  include Weather

  attr_reader :capacity


  def initialize (airport_id: 1, capacity: DEFAULT_CAPACITY)
    @airport_id = airport_id
    @capacity = capacity
    @planes = []
    # @weather = weather
  end

  def full?
    @planes.size == @capacity
  end

  def accept(plane) #accepting plane to land
    raise "Airport is full" if full?
    raise "Weather is bad" if  self.weather == BAD
    @planes << plane.land 
  end

  def count   #counts plane in the airport
    @planes.count
  end

  def allow(plane,airport_id)
    raise "Weather is bad" if weather_stormy?
    plane.take_off(airport_id: airport_id)
    @planes.delete(plane)
  end  

  def weather_stormy?
    weather == BAD
  end

end




