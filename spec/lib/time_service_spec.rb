# frozen_string_literal: true

require_relative '../../lib/time_service'

RSpec.describe TimeService do
  it 'can be received configuration params with a block' do
    described_class.configure do |config|
      config.day_end = '9:00 PM'
    end
    expect(described_class.configuration.day_end).to eq('9:00 PM')
  end

  describe 'Configuration' do
    subject(:configuration) { TimeService::Configuration.new }

    it 'initializes day_start variable' do
      expect(configuration.day_start).to eq('9:00 AM')
    end

    it 'initializes day_end variable' do
      expect(configuration.day_end).to eq('6:00 PM')
    end
  end

  describe 'Time' do
    subject(:time) { TimeService::Time.new }

    it 'inherits Configuration class' do
      expect(time.day_start).to eq('9:00 AM')
    end

    describe '#add_minutes' do
      it 'adds minutes correctly when it is AM' do
        expect(time.add_minutes('9:13 AM', 10)).to eq('9:23 AM')
      end

      it 'adds minutes correctly when it is PM' do
        expect(time.add_minutes('9:13 PM', 10)).to eq('9:23 PM')
      end

      it 'adds minutes correctly when it is next day after addition' do
        expect(time.add_minutes('11:13 PM', 50)).to eq('0:03 AM')
      end
    end
  end
end
