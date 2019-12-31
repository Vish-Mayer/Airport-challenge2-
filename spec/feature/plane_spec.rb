require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  describe '.airbourne_status' do 
    it 'is regarded as true when created' do 
      expect(plane.airbourne).to eq true 
    end
  end 

  describe '#landed' do 
    it 'changes airbourne_status to false when the plane has landed' do
      plane.landed 
      expect(plane.airbourne).to eq false 
    end 
    it 'logs a timestamp whenever a plane lands' do
      plane.landed
      expect(plane.timestamp).not_to be_empty 
    end 
  end
  
  describe '#take_off' do 
    it 'changes the airbourne_status to true' do
      plane.take_off 
      expect(plane.airbourne).to eq true
    end
    it 'logs a timestamp whenever a plane takes-off' do
      plane.take_off 
      expect(plane.timestamp).not_to be_empty 
    end 
  end   

  describe '#in_air?' do 
    it 'changes the airbourne_status to true when the plane takes-off' do 
      plane.in_air?  
      expect(plane.airbourne).to eq true 
    end 
  end 
end 


   
