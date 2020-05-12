require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe '#forecast' do
    it 'returns either sunny or clear' do
      expect(weather.forecast).to eq("stormy").or eq("clear")
    end
  end

  describe '#stormy?' do
    it 'returns true if the weather is stormy' do
      allow(Kernel).to receive(:rand).and_return 0
      expect(weather.stormy?).to eq true
    end
    it 'returns false if the weather is clear' do
      allow(Kernel).to receive(:rand).and_return 5
      expect(weather.stormy?).to eq false
    end
  end
end
