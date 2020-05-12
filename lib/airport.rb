require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :hanger, :capacity, :weather_report 
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY,
                 weather = Weather.new)
    @capacity = capacity
    @hanger = []
    @weather_report = weather
  end

  def land(plane)
    raise "#{plane} has already landed" unless plane.in_air?
    raise "Cannot land: #{self} is full" if full?
    raise "WEATHER WARNING: Cannot land" if stormy?

    plane.landed
    add_plane(plane)
    "#{plane}: Landing confirmed"
  end

  def take_off(plane)
    raise "#{plane}: is already airbourne" if plane.in_air?
    raise "WEATHER WARNING: Cannot take-off" if stormy?

    plane.take_off
    remove_plane(plane)
    "#{plane}: Take-off confirmed"
  end

  private

  def add_plane(plane)
    @hanger << plane
  end

  def remove_plane(plane)
    @hanger.delete(plane)
  end

  def full?
    @hanger.count >= @capacity
  end

  def stormy?
    @weather_report.stormy?
  end
end
