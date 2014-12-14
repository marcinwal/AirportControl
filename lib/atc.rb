require_relative 'weather.rb'

class ATC

  attr_reader :x, :y

  include Weather

  def initialize(args) #grids for positions of planes&airp
      @x = args[:gridx]
      @y = args[:gridy]
      @airports = []
      @planes= []
      @screen = Array.new(@x*@y,' ')
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

  def in_the_air
    @planes.select{|pl| pl[:plane].flying?}.count
  end

 #finds coordinates of given target airport and returns airport,posx,posy
 def find_airport_xy(target)
    @airports.each do |ports|
      return ports[:port],ports[:x],ports[:y] if (ports[:port].airport_id == target)
    end
  end

  #checks if position matches aiport id and position
  #returns airport object if matched with its position
  #returns coordinates of the airport
  def airport_match(target,x,y)
      port,portx,porty = find_airport_xy(target)
      if (portx == x) && (porty == y) 
        return port,portx,porty
      else
        return nil,portx,porty
      end
  end

 

  #checks if position of the plane is in line with the position of the airport
  #then plane is landing if weather is ok if not stays in the same position
  def check_for_landing_and_move
    flying_planes = @planes.select{|pl| pl[:plane].flying?}
    flying_planes.each do |pl|
      @screen[pl[:x] + pl[:y] * @x] = 'P'                                #for drawing 
      airport,ax,ay = airport_match(pl[:plane].target,pl[:x],pl[:y])     #search for matchin airport
      if ((airport != nil) and airport.weather == GOOD)                  #possible landing
        airport.accept(pl[:plane])
        @screen[ax + ay * @x] = 'L'                                      #for drawing
      elsif (airport == nil)
        difx,dify = ax - pl[:x],ay - pl[:y]
        if difx < 0 then pl[:x]-=1; next end
        if difx > 0 then pl[:x]+=1; next end 
        if dify < 0 then pl[:y]-=1; next end
        if dify > 0 then pl[:y]+=1; next end  
      end
    end
  end

  def screen_reset
    for i in 0...@x * @y do
      @screen[i] = ' '
    end
  end

  def draw
    system('clear')
    for i in 0...@x * @y do
      print @screen[i]
      print "\n" if ((i + 1) % @x ) == 0
    end  
  end

end
