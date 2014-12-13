class Airport

DEFAULT_CAPACITY = 10  

  attr_reader :capacity


  def initialize (args)
    @airport_id = args[:airport_id]
    @capacity = args[:capacity]
    @planes = []
  end

  def full?
    @planes.size == @capacity
  end

  def accept(plane) #accepting plane to land
    @planes << plane.land
  end

  def count   #counts plane in the airport
    @planes.count
  end

  def allow(plane,airport_id)
    plane.take_off(airport_id: airport_id)
    @planes.delete(plane)
  end  

end
