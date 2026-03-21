# frozen_string_literal: true

RSpec.describe Legion::Extensions::Sonos::Runners::Zones do
  let(:client) { Legion::Extensions::Sonos::Client.new(url: 'http://localhost:5005') }

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:test_connection) do
    Faraday.new(url: 'http://localhost:5005') do |conn|
      conn.response :json, content_type: /\bjson$/
      conn.adapter :test, stubs
    end
  end

  before { allow(client).to receive(:connection).and_return(test_connection) }

  describe '#list_zones' do
    it 'returns all zones' do
      stubs.get('/zones') do
        [200, { 'Content-Type' => 'application/json' },
         [{ 'coordinator' => { 'roomName' => 'Living Room' }, 'members' => [] }]]
      end
      result = client.list_zones
      expect(result[:zones]).to be_an(Array)
      expect(result[:zones].first['coordinator']['roomName']).to eq('Living Room')
    end
  end

  describe '#zone_state' do
    it 'returns state for a specific room' do
      stubs.get('/Living+Room/state') do
        [200, { 'Content-Type' => 'application/json' },
         { 'playbackState' => 'PLAYING', 'currentTrack' => { 'title' => 'Test Song' } }]
      end
      result = client.zone_state(room: 'Living Room')
      expect(result[:state]['playbackState']).to eq('PLAYING')
      expect(result[:state]['currentTrack']['title']).to eq('Test Song')
    end
  end
end
