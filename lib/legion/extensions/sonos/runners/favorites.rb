# frozen_string_literal: true

require 'uri'

module Legion
  module Extensions
    module Sonos
      module Runners
        module Favorites
          def list_favorites(**)
            resp = connection(**).get('/favorites')
            { favorites: resp.body }
          end

          def play_favorite(room:, name:, **)
            encoded_room = URI.encode_www_form_component(room)
            encoded_name = URI.encode_www_form_component(name)
            resp = connection(**).get("/#{encoded_room}/favorite/#{encoded_name}")
            { status: resp.body }
          end
        end
      end
    end
  end
end
