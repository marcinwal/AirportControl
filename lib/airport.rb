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

  def count
    @planes.count
  end

end
