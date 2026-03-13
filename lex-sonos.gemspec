# frozen_string_literal: true

require_relative 'lib/legion/extensions/sonos/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-sonos'
  spec.version       = Legion::Extensions::Sonos::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::Sonos'
  spec.description   = 'LEX::Sonos'
  spec.homepage      = 'https://github.com/LegionIO/lex-sonos'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LegionIO/lex-sonos'
  spec.metadata['documentation_uri'] = 'https://github.com/LegionIO/lex-sonos'
  spec.metadata['changelog_uri'] = 'https://github.com/LegionIO/lex-sonos'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/LegionIO/lex-sonos/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.require_paths = ['lib']
end
