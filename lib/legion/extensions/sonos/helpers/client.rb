# frozen_string_literal: true

require 'faraday'

module Legion
  module Extensions
    module Sonos
      module Helpers
        module Client
          module_function

          def connection(url: 'http://localhost:5005', **_opts)
            Faraday.new(url: url) do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.adapter Faraday.default_adapter
            end
          end
        end
      end
    end
  end
end
