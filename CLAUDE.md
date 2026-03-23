# lex-sonos: Sonos Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to Sonos speakers via a local Sonos HTTP API bridge (e.g., node-sonos-http-api). Provides runners for player control, zone inspection, and favorites playback.

**GitHub**: https://github.com/LegionIO/lex-sonos
**License**: MIT
**Version**: 0.2.1

## Architecture

```
Legion::Extensions::Sonos
├── Runners/
│   ├── Player     # play, pause, stop, next_track, previous_track, volume, mute
│   ├── Zones      # list, get
│   └── Favorites  # list, play
├── Helpers/
│   └── Client     # Faraday connection to local Sonos HTTP API bridge (default: localhost:5005)
└── Client         # Standalone client class (includes all runners)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/sonos.rb` | Entry point, extension registration |
| `lib/legion/extensions/sonos/runners/player.rb` | Playback control runners |
| `lib/legion/extensions/sonos/runners/zones.rb` | Zone listing and info runners |
| `lib/legion/extensions/sonos/runners/favorites.rb` | Favorites list and play runners |
| `lib/legion/extensions/sonos/helpers/client.rb` | Faraday connection to Sonos HTTP API bridge |
| `lib/legion/extensions/sonos/client.rb` | Standalone Client class |

## Requirements

Sonos speakers do not expose a direct HTTP API. This extension targets a local HTTP bridge such as [node-sonos-http-api](https://github.com/jishi/node-sonos-http-api) running at `http://localhost:5005` (configurable).

## Configuration

```json
{
  "lex-sonos": {
    "url": "http://localhost:5005"
  }
}
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` (~> 2.0) | HTTP client for local Sonos HTTP API bridge |
| `legion-cache` (>= 1.3.11) | Cache helper (transitive via Helpers::Lex) |
| `legion-crypt` (>= 1.4.9) | Vault/crypt helper (transitive via Helpers::Lex) |
| `legion-data` (>= 1.4.17) | Data helper (transitive via Helpers::Lex) |
| `legion-json` (>= 1.2.1) | JSON helper (transitive via Helpers::Lex) |
| `legion-logging` (>= 1.3.2) | Logging helper (transitive via Helpers::Lex) |
| `legion-settings` (>= 1.3.14) | Settings helper (transitive via Helpers::Lex) |
| `legion-transport` (>= 1.3.9) | Transport helper (transitive via Helpers::Lex) |

## Development

18 specs.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
