# Twitch API Wrapper
[![CI Status](https://api.travis-ci.org/epv44/TwitchAPIWrapper.svg)](https://travis-ci.org/epv44/TwitchAPIWrapper)
## About
Very much a work in progress, however, this will be a generic API client with a dataSource wrapper allowing easy calls to the Twitch API.  There will be seperate dataSource objects corresponding with the JSON requests in the Twitch API and a presenter layer (utilizing the Delegate Design Pattern) that will allow users to hook in to the specific Objects they want.

## Current Progress
* Created API skeleton
* Implemented OAuth client
* Created sample app skeleton 

## TODO
* Build out models/presenters
* Improve example app
* Documentation
* Test Coverage
* Cocoapods/Carthage/Swift Package Manager Connections
* Continuous integration
* Code coverage

## Requirements
* Swift 3.0+
* iOS 10.0 +

## Installation

#### [CocoaPods](http://cocoapods.org)

```ruby
pod "TwitchAPIWrapper"
```

#### [Carthage](https://github.com/Carthage/Carthage)

```Bash
github epv44/TwitchAPIWrapper
```

## Documentation
Read the [docs][docsLink]. Generated with [jazzy](https://github.com/realm/jazzy)

