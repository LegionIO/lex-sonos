require_relative 'lib/legion/extensions/sonos/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-sonos'
  spec.version       = Legion::Extensions::Sonos::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::Sonos'
  spec.description   = 'LEX::Sonos'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-sonos'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-sonos'
  spec.metadata['documentation_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/614957074'
  spec.metadata['changelog_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/612270167'
  spec.metadata['bug_tracker_uri'] = 'https://bitbucket.org/legion-io/lex-sonos/issues'
  spec.require_paths = ['lib']
end
