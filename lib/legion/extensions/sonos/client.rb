# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/player'
require_relative 'runners/zones'
require_relative 'runners/favorites'

module Legion
  module Extensions
    module Sonos
      class Client
        include Helpers::Client
        include Runners::Player
        include Runners::Zones
        include Runners::Favorites

        attr_reader :opts

        def initialize(url: 'http://localhost:5005', **extra)
          @opts = { url: url, **extra }
        end

        def settings
          { options: @opts }
        end

        def connection(**override)
          Helpers::Client.connection(**@opts, **override)
        end
      end
    end
  end
end
