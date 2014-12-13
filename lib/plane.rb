class Plane

  FULL = 100
  
  attr_reader :flying

  def initialize(airport_id: airport_id)
    @target_airport = airport_id
    @flying = true
    #@fuel = FULL can add more like fuel comsumption 
    #@x,y,z              #and time spent in air since refuel
    #@speed
  end

  #plane takes off from the airport headding for airport
  def take_off(airport_id: airport_id)  #airportid  - target airport
    @flying = true
    @target_airport = airport_id
  end

  def land
    @flying = false
  end

  def flying?
    @flying
  end

end

