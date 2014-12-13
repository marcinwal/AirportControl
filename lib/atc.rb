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
    airport = args[:airport]
    posx = args[:x]
    posy = args[:y]
    @airports << {port: airport,x: posx, y: posy}
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



 #finds coordinates of given target airport and returns airport,posx,posy
 def find_airport_xy(target)
    @airports.each do |ports|
      return ports[:port],ports[:x],ports[:y] if (ports[:port].airport_id == target)
    end
  end

  #checks if position matches aiport id and position
  def airport_match(target,x,y)
      port,portx,porty = find_airport_xy(target)
      if (portx == x) && (porty == y) 
        return port
      else
        return nil
      end
  end

 

  #checks if position of the plane is in line with the position of the airport
  #then plane is landing if weather is ok if not stays in the same position
  def check_for_landing
    flying_planes = @planes.select{|pl| pl[:plane].flying?}
    flying_planes.each do |pl|
      target = pl[:plane].target #target of the current plane
      posx = pl[:x]              #current airplane data 
      posy = pl[:y]              #to delete later
      airport = airport_match(target,posx,posy)
      airport.accept(pl[:plane]) if ((airport != nil) and airport.weather == GOOD)
    end
  end

  #moving the planes according to their targets 
  #1st left-rigth then up-down
  #no crush check
  def move_the_planes
    flying_planes = @planes.select{|pl| pl[:plane].flying?}
    flying_planes.each do |pl|
    posx = pl[:x]              #current airplane data 
    posy = pl[:y]              #to delete later
    end
  end

end
