class Weather

  def bad_weather?
    Kernel.rand(1..6) > 4
  end
end
