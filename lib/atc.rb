class ATC

  attr_reader :x, :y

  def initialize(args) #grids for positions of planes&airp
      @x = args[:gridx]
      @y = args[:gridy]
  end  


end
