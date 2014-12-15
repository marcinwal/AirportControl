class Plane
  
  attr_reader :flying

  def initialize(airport_id: airport_id)
    @target_airport = airport_id
    @flying = true
    #@fuel = FULL can add more like fuel comsumption 
    #@x,y,z              #and time spent in air since refuel
  #@speed
    #weather -can couse the plane to change a target plane
    #time since last take off
  end

  #plane takes off from the airport headding for airport
  def take_off(airport_id: airport_id)  #airportid  - target airport
    raise 'Already flying' if flying?
    @flying = true
    @target_airport = airport_id
  end


  def land(airport_id: airport_id)
    raise 'Already grounded' unless flying?
    raise 'Wrong airport' unless @target_airport == airport_id
    @flying = false
    self
  end

  def flying?
    @flying
  end

end

