# Changelog

## [0.2.0] - 2026-03-21

### Added
- `Helpers::Client` module with Faraday connection builder (default base URL: `http://localhost:5005`)
- `Runners::Player` module: play, pause, stop, next_track, previous_track, volume, mute
- `Runners::Zones` module: list (all zones), get (single room state)
- `Runners::Favorites` module: list (all favorites), play (play favorite by name in room)
- Standalone `Client` class including all runner modules
- Full spec suite (21 examples)
- faraday ~> 2.0 runtime dependency

## [0.1.0] - 2026-03-13

### Added
- Initial release
