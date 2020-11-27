# Ursus API

An Urbit API/`%gall` agent client for iOS/macOS in Swift.

See my [Ursus Chat](https://github.com/dclelland/UrsusChat) repository for a demo project.

## Installation

Ursus can be installed using Cocoapods by adding the following line to your podfile:

```ruby
pod 'UrsusAPI', '~> 0.1'
```

I can probably help set up Carthage or Swift Package Manager support if you need it.

## Todo list

Things that would make this codebase nicer:

- [ ] Rename UrsusAirlock to UrsusHTTP
- [ ] Move `AirlockApp` into UrsusAPI, rename and convert to a protocol
- [ ] Figure out how to move the reducers into the framework
- [ ] Add special `Index` and `OrderedDictionary` types
- [ ] Add `graph-store` client
- [ ] Add clients for other gall apps
- [ ] Split clients into separate subspecs
- [ ] Better documentation/examples.

## Dependencies

- [UrsusAirlock](https://github.com/dclelland/UrsusAirlock)