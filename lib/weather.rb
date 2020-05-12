class Weather

  def stormy?
    forecast == "stormy"
  end

  def forecast
    Kernel.rand(5).zero? ? "stormy" : "clear"
  end
end
