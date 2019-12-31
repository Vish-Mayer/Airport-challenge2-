require_relative 'airport' 

class Plane

  attr_reader :airbourne
  attr_reader :timestamp

  def initialize
    @airbourne = true
    @timestamp = [] 
  end

  def in_air? 
    @airbourne  
  end

  def landed
    @airbourne = false 
    land_timestamp
  end

  def take_off
    @airbourne = true
    take_off_timestamp 
  end

  private 

  def land_timestamp
    @timestamp << "Landed at #{Time.new}" 
  end 

  def take_off_timestamp
    @timestamp << "Took off at #{Time.new}" 
  end 
  
end  

  