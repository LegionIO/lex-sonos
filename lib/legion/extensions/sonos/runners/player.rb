# frozen_string_literal: true

require 'uri'

module Legion
  module Extensions
    module Sonos
      module Runners
        module Player
          def play(room:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/play")
            { status: resp.body }
          end

          def pause(room:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/pause")
            { status: resp.body }
          end

          def stop(room:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/stop")
            { status: resp.body }
          end

          def next_track(room:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/next")
            { status: resp.body }
          end

          def previous_track(room:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/previous")
            { status: resp.body }
          end

          def volume(room:, level:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/volume/#{level}")
            { status: resp.body }
          end

          def mute(room:, **)
            resp = connection(**).get("/#{URI.encode_www_form_component(room)}/mute")
            { status: resp.body }
          end
        end
      end
    end
  end
end
