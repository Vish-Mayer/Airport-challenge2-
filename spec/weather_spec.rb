require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe 'bad_weather?' do
    it 'returns false for good weather' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.bad_weather?).to eq false
    end
    it 'returns true for bad weather' do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather.bad_weather?).to eq true
    end
  end
end
