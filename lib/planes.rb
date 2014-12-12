class Plane

  FULL = 100
  
  def initialize(airport_id)
    @flying = true #airborn is flying, false if lended
    @target_airport = airport_id
    @fuel = FULL
  end

  #plane takes off from the airport headding for airport
  def take_off(airport) 
    @flying = true
    @target_airport = airport_id
  end

  def land

  end

