require 'legion/extensions/sonos/version'

module Legion
  module Extensions
    module Sonos
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
