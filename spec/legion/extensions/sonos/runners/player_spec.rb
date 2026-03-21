# frozen_string_literal: true

RSpec.describe Legion::Extensions::Sonos::Runners::Player do
  let(:client) { Legion::Extensions::Sonos::Client.new(url: 'http://localhost:5005') }

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:test_connection) do
    Faraday.new(url: 'http://localhost:5005') do |conn|
      conn.response :json, content_type: /\bjson$/
      conn.adapter :test, stubs
    end
  end

  before { allow(client).to receive(:connection).and_return(test_connection) }

  describe '#play' do
    it 'sends play command to the specified room' do
      stubs.get('/Living+Room/play') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.play(room: 'Living Room')
      expect(result[:status]['status']).to eq('success')
    end
  end

  describe '#pause' do
    it 'sends pause command to the specified room' do
      stubs.get('/Bedroom/pause') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.pause(room: 'Bedroom')
      expect(result[:status]['status']).to eq('success')
    end
  end

  describe '#stop' do
    it 'sends stop command to the specified room' do
      stubs.get('/Office/stop') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.stop(room: 'Office')
      expect(result[:status]['status']).to eq('success')
    end
  end

  describe '#next_track' do
    it 'sends next command to the specified room' do
      stubs.get('/Living+Room/next') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.next_track(room: 'Living Room')
      expect(result[:status]['status']).to eq('success')
    end
  end

  describe '#previous_track' do
    it 'sends previous command to the specified room' do
      stubs.get('/Living+Room/previous') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.previous_track(room: 'Living Room')
      expect(result[:status]['status']).to eq('success')
    end
  end

  describe '#volume' do
    it 'sets volume level for the specified room' do
      stubs.get('/Kitchen/volume/50') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.volume(room: 'Kitchen', level: 50)
      expect(result[:status]['status']).to eq('success')
    end
  end

  describe '#mute' do
    it 'sends mute command to the specified room' do
      stubs.get('/Bedroom/mute') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.mute(room: 'Bedroom')
      expect(result[:status]['status']).to eq('success')
    end
  end
end
