module Weather

  GOOD = :sunny
  BAD = :stormy
  TOSSES = 100
  BAD_TOSSES = 20

  def weather
    @weather = rand(TOSSES) > (TOSSES - BAD_TOSSES)? BAD: GOOD
  end

end
