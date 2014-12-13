class Airport

DEFAULT_CAPACITY = 10  


  def initialize (options = {})
    self.airport_id = options.fetch(:airport_id,airport_id)
    self.capacity = options.fetch(:capacity,capacity)
    @planes = []
  end

  def full?
    @planes.size == @capacity
  end

end
