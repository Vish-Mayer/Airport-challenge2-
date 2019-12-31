require_relative 'plane' 

class Airport

  attr_reader :hanger 
  attr_reader :capacity
  DEFAULT_CAPACITY = 5 

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @hanger = [] 
  end  

  def land(plane)
    raise "#{plane} has already landed" unless plane.in_air? #needs testing 
    raise "Cannot land: #{self} is full" if full? 
    @hanger << plane
    plane.landed
    "#{plane}: Landing confirmed"
  end 

  def take_off(plane)
    raise "#{plane}: is already airbourne" if plane.in_air?
    plane.take_off
    @hanger.delete(plane) 
    "#{plane}: Take-off confirmed" 
  end 

  private

  def full?
    @hanger.count >= @capacity
  end 
end 