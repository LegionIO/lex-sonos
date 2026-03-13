# lex-sonos: Sonos Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to Sonos speakers. Provides the foundation for controlling Sonos devices from within Legion task chains.

**GitHub**: https://github.com/LegionIO/lex-sonos
**License**: MIT

## Architecture

```
Legion::Extensions::Sonos
└── (base extension - skeleton, no runners or runtime dependencies)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/sonos.rb` | Entry point, extension registration |
| `lib/legion/extensions/sonos/version.rb` | Version constant |

## Development Notes

This extension is a minimal skeleton. The gemspec has no runtime dependencies. Runner implementation for Sonos device control (play, pause, volume, etc.) is not yet present.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
