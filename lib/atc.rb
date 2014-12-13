class ATC

  attr_reader :x, :y

  def initialize(args) #grids for positions of planes&airp
      @x = args[:gridx]
      @y = args[:gridy]
      @airports = []
      @planes= []
  end  

  #adding airports to the system
  def add_airport(args)
    @airports << {}
  end  

  #adding plane to the space 
  def add_plane(plane)
    @planes << {plane: plane, x: rand(@x), y: rand(@y)}
  end


  #counts number of planes in the system
  def planes_n
    @planes.count
  end

  #counts number of airports in the system
  def airports_n
    @airports.count
  end

  def grid
    @x
  end

end
