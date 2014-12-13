class ATC

  attr_reader :x, :y

  def initialize(args) #grids for positions of planes&airp
      @x = args[:gridx]
      @y = args[:gridy]
      @airports = {}
      @planes={}
  end  

  #adding airports to the system
  def add_airport(airport,airport_id,x,y)
    @airports << {airport: airport,id: id,x: x, y: y}
  end  

  #adding plane to the space 
  def add_planes(plane)
    @planes << {plane: plane, x: random(@x), y: random(@y)}
  end


  #counts number of planes in the system
  def planes_n
    @planes.count
  end

  #counts number of airports in the system
  def airports_n
    @airports.count
  end
end
