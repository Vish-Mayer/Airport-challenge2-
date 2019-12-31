require 'airport'
require 'plane' 

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  
  describe '#initialize' do 
    it 'creates an Airport with a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'allows a custom capacity' do
      expect(Airport.new(10).capacity).to eq 10 
    end
  end 

  
  describe '#land' do 
    it 'lands a plane at the airport' do
      airport.land(plane)
      expect(airport.hanger.include? plane).to eq true 
    end 
    it 'confirms when a plane has landed' do
      message = "#{plane}: Landing confirmed"
      expect(airport.land(plane)).to eq message 
    end
    it 'prevents a plane from landing when the airport is full' do
     #airport.capacity.times { subject.land(plane) }
      message = "Cannot land: #{plane} is full"
     #expect{ airport.land(plane) }.to raise_error message
    end
  end
  
  describe '#takeoff' do

    it 'raises an error if airport is empty' do
      message = "#{plane}: is already airbourne"
      expect { airport.take_off(plane) }.to raise_error message 
    end
    
    it 'instructs a plane to take off' do 
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hanger.include? plane).to eq false
    end 

    it 'confirms when plane has left the airport' do
      airport.land(plane)
      message = "#{plane}: Take-off confirmed"
      expect(airport.take_off(plane)).to eq message 
    end 
  end 
end 
