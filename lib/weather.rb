class Weather
    

  def stormy?
    forecast == "stormy"
  end

  def forecast
    current_weather = rand(5) == 0 ? "stormy" : "clear"
  end
end