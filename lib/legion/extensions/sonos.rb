# frozen_string_literal: true

require 'legion/extensions/sonos/version'
require 'legion/extensions/sonos/helpers/client'
require 'legion/extensions/sonos/runners/player'
require 'legion/extensions/sonos/runners/zones'
require 'legion/extensions/sonos/runners/favorites'
require 'legion/extensions/sonos/client'

module Legion
  module Extensions
    module Sonos
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
