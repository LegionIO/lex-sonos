# frozen_string_literal: true

RSpec.describe Legion::Extensions::Sonos::Runners::Favorites do
  let(:client) { Legion::Extensions::Sonos::Client.new(url: 'http://localhost:5005') }

  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:test_connection) do
    Faraday.new(url: 'http://localhost:5005') do |conn|
      conn.response :json, content_type: /\bjson$/
      conn.adapter :test, stubs
    end
  end

  before { allow(client).to receive(:connection).and_return(test_connection) }

  describe '#list_favorites' do
    it 'returns all favorites' do
      stubs.get('/favorites') do
        [200, { 'Content-Type' => 'application/json' },
         [{ 'title' => 'My Radio Station', 'uri' => 'x-sonosapi-stream:...' }]]
      end
      result = client.list_favorites
      expect(result[:favorites]).to be_an(Array)
      expect(result[:favorites].first['title']).to eq('My Radio Station')
    end
  end

  describe '#play_favorite' do
    it 'plays a favorite by name in the specified room' do
      stubs.get('/Living+Room/favorite/My+Radio+Station') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.play_favorite(room: 'Living Room', name: 'My Radio Station')
      expect(result[:status]['status']).to eq('success')
    end

    it 'URL-encodes special characters in the favorite name' do
      stubs.get('/Office/favorite/Jazz+%26+Blues') do
        [200, { 'Content-Type' => 'application/json' }, { 'status' => 'success' }]
      end
      result = client.play_favorite(room: 'Office', name: 'Jazz & Blues')
      expect(result[:status]['status']).to eq('success')
    end
  end
end
