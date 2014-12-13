module Weather

  STATES = ['sunny','stormy']
  TOSSES = 100
  BAD_TOSSES = 20

  def weather
    @weather = STATES[0] #more likely
  end

  def check_weather
      rand(TOSSES)>(TOSSES-BAD_TOSSES)? STATES[1]: STATES[0]
  end

end
