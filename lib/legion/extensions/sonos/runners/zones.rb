# frozen_string_literal: true

require 'uri'

module Legion
  module Extensions
    module Sonos
      module Runners
        module Zones
          def list_zones(**)
            resp = connection(**).get('/zones')
            { zones: resp.body }
          end

          def zone_state(room:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/state")
            { state: resp.body }
          end
        end
      end
    end
  end
end
