# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Timezone full support. [#1](https://github.com/icyleaf/sidekiq.cr/pull/1)

### Changed

- Use information instead of empty busy queues list in web UI.
- Use Crystal to rewrite load_fixture in spec.

### Fixed

- Fixes locales detected in web UI.
- Fixes garbled in non-english locales.
- Fixes Simplified Chinese locale file.

## [0.7.2]

### Fixed

- Fixes `perform_at` for Workers.

## [0.7.1]

### Fixed

- Fixes unix format.

## [0.7.0]

### Added

- Adds `perform_in` with `Time::MonthSpan` support.

### Changed

- Changes kemal to development dependency.

### Fixed

- Cyrstal 0.27.0 support

## [0.6.1]

### Fixed

- Updates for latest Crystal, Kemal versions

## [0.6.0]

### Fixed

- Fixes for Crystal 0.19

### Added

- Implement `sidekiq_options` for Workers. [#3](https://github.com/mperham/sidekiq.cr/issues/3)

## 0.5.0

- Initial release.  See the wiki for how to [Get Started](https://github.com/mperham/sidekiq.cr/wiki/Getting-Started)!

[Unreleased]: https://github.com/icyleaf/sidekiq.cr/compare/v0.7.2...HEAD
[0.7.2]: https://github.com/icyleaf/sidekiq.cr/compare/v0.7.1...v0.7.2
[0.7.1]: https://github.com/icyleaf/sidekiq.cr/compare/v0.7.0...v0.7.1
[0.7.0]: https://github.com/icyleaf/sidekiq.cr/compare/v0.6.1...v0.7.0
[0.6.1]: https://github.com/icyleaf/sidekiq.cr/compare/v0.6.0...v0.6.1
[0.6.0]: https://github.com/icyleaf/sidekiq.cr/compare/v0.5.0...v0.6.0
