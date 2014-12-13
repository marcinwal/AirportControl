class ATC

  attr_reader :x, :y

  def initialize(args) #grids for positions of planes&airp
      @x = args[:gridx]
      @y = args[:gridy]
      @airports = {}
      @planes=[]
  end  

  #adding airports to the system
  def add_airport(airport,airport_id)
    @airports[airport_id]=airport
  end  

  #adding plane to the space 
  def add_planes(plane)
    @planes << plane
  end
end
