require 'airport'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:plane1) { double(in_air?: true, landed: false) }
  let(:plane2) { double(in_air?: true, landed: false) }
  let(:plane3) { double(in_air?: true, landed: false) }
  let(:plane4) { double(in_air?: true, landed: false) }
  let(:plane5) { double(in_air?: true, landed: false) }

  before do
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane1)
    airport.land(plane2)
    airport.land(plane3)
    airport.land(plane4)
  end

  describe '#initialize' do
    it 'creates an Airport with a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'allows a custom capacity' do
      expect(Airport.new(10).capacity).to eq 10
    end
    it 'is initialized with a new instance of weather' do
      expect(airport.weather_report).to be_an_instance_of(Weather)
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
      airport.land(plane5)
      message = "Cannot land: #{airport} is full"
      expect { airport.land(plane) }.to raise_error message
    end
    it 'raises an error when trying to land a plane that is not in_air?' do
      airport.land(plane)
      message = "#{plane} has already landed"
      expect { airport.land(plane) }.to raise_error message
    end
    it 'prevents a plane from landing in bad weather' do
      allow(airport).to receive(:stormy?).and_return true
      message = "WEATHER WARNING: Cannot land"
      expect { airport.land(plane) }.to raise_error message
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
    it 'raises an error when trying to take off a plane that is in_air?' do
      message = "#{plane}: is already airbourne"
      expect { airport.take_off(plane) }.to raise_error message
    end
    it 'prevents a plane from taking off in bad weather' do
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return true
      message = "WEATHER WARNING: Cannot take-off"
      expect { airport.take_off(plane) }.to raise_error message
    end
  end
end
