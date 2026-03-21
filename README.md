# lex-sonos

Sonos speaker control for [LegionIO](https://github.com/LegionIO/LegionIO). Control Sonos devices from within Legion task chains via the [node-sonos-http-api](https://github.com/jishi/node-sonos-http-api) bridge (or compatible local HTTP API).

## Installation

```bash
gem install lex-sonos
```

Or add to your Gemfile:

```ruby
gem 'lex-sonos'
```

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- Sonos speakers on local network
- A local Sonos HTTP API bridge (e.g. [node-sonos-http-api](https://github.com/jishi/node-sonos-http-api)) running at `http://localhost:5005` (configurable)

## Usage

### Standalone Client

```ruby
require 'lex-sonos'

client = Legion::Extensions::Sonos::Client.new(url: 'http://localhost:5005')

# Player controls
client.play(room: 'Living Room')
client.pause(room: 'Living Room')
client.stop(room: 'Living Room')
client.next_track(room: 'Living Room')
client.previous_track(room: 'Living Room')
client.volume(room: 'Living Room', level: 50)
client.mute(room: 'Living Room')

# Zone information
client.list   # => { zones: [...] }
client.get(room: 'Living Room')  # => { state: { playbackState: 'PLAYING', ... } }

# Favorites
client.list   # => { favorites: [...] }
client.play(room: 'Living Room', name: 'My Radio Station')
```

## Runners

| Module | Methods |
|--------|---------|
| `Runners::Player` | `play`, `pause`, `stop`, `next_track`, `previous_track`, `volume`, `mute` |
| `Runners::Zones` | `list`, `get` |
| `Runners::Favorites` | `list`, `play` |

## Configuration

The default base URL is `http://localhost:5005`. Override it when constructing the client:

```ruby
client = Legion::Extensions::Sonos::Client.new(url: 'http://192.168.1.100:5005')
```

## License

MIT
