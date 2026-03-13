# lex-sonos: Sonos Integration for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to Sonos speakers. Provides the foundation for controlling Sonos devices from within Legion task chains.

**License**: MIT

## Architecture

```
Legion::Extensions::Sonos
└── (base extension with Sonos integration)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/sonos.rb` | Entry point, extension registration |
| `lib/legion/extensions/sonos/version.rb` | Version constant |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
