require_relative 'airport' 

class Plane

  attr_reader :airborne
  attr_reader :timestamp

  def initialize()
    @airborne = true
    @timestamp = [] 
  end

  def in_air? 
    @airborne  
  end

  def landed
    @airborne = false 
    land_timestamp
  end

  def take_off
    @airborne = true
    take_off_timestamp 
  end

  private 

  def land_timestamp
    @timestamp << "Landed at #{Time.now.strftime("%c")}" 
  end 

  def take_off_timestamp
    @timestamp << "Took off at #{Time.now.strftime("%c")}" 
  end 
  
end  

  