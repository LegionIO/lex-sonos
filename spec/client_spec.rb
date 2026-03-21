# frozen_string_literal: true

RSpec.describe Legion::Extensions::Sonos::Client do
  subject(:client) { described_class.new(url: 'http://localhost:5005') }

  describe '#initialize' do
    it 'stores url in opts' do
      expect(client.opts[:url]).to eq('http://localhost:5005')
    end

    it 'uses default url when none provided' do
      c = described_class.new
      expect(c.opts[:url]).to eq('http://localhost:5005')
    end

    it 'stores extra kwargs in opts' do
      c = described_class.new(url: 'http://192.168.1.10:5005', timeout: 10)
      expect(c.opts[:timeout]).to eq(10)
    end
  end

  describe '#settings' do
    it 'returns a hash with options key' do
      expect(client.settings).to eq({ options: client.opts })
    end
  end

  describe '#connection' do
    it 'returns a Faraday connection' do
      expect(client.connection).to be_a(Faraday::Connection)
    end
  end
end
