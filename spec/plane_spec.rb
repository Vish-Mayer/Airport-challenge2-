require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '.airborne_status' do
    it 'is regarded as true when created' do
      expect(plane.airborne).to eq true
    end
  end

  describe '#landed' do
    it 'changes airbourne_status to false when the plane has landed' do
      plane.landed
      expect(plane.airborne).to eq false
    end
    it 'logs a timestamp whenever a plane lands' do
      plane.landed
      expect(plane.timestamp).to eq ["Landed at #{Time.now.strftime("%c")}"]
    end
  end

  describe '#take_off' do
    it 'changes the airbourne_status to true' do
      plane.take_off
      expect(plane.airborne).to eq true
    end
    it 'logs a timestamp whenever a plane takes-off' do
      plane.take_off
      expect(plane.timestamp).to eq ["Took off at #{Time.now.strftime("%c")}"]
    end
  end

  describe '#in_air?' do
    it 'changes the airbourne_status to true when the plane takes-off' do
      plane.in_air?
      expect(plane.airborne).to eq true
    end
  end
end
