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

[docsLink]:

#### Generate

```Bash
$ ./build_docs.sh
```

#### Preview

```bash
$ open index.html -a Safari
```

## Getting Started

```Swift
import TwitchAPIWrapper
```

#### Design
This library has two main sections

1. Authorization - Utilizing the Twitch OAuth protocol inside of your app
2. Datasources - Utilizing the Twitch API to Swift Models based off of Twitch server side data

#### Example

The following example illustrates how to setup the OAuth components and utilize the Presenter Object (DataSource's) to retrieve models.

##### Twitch OAuth
**For OAuth add your url type and specify your url Scheme**

```Swift
// Setup OAuth, this can be placed wherever you wish; however, as you can see in the example project it is placed inside of the App delegate so
// that authorization is done when the app is first loaded.
TwitchAuthorizationManager.sharedInstance.clientID = configuration["clientID"] as? String
TwitchAuthorizationManager.sharedInstance.redirectURI = configuration["redirectURI"] as? String
TwitchAuthorizationManager.sharedInstance.scopes = configuration["scopes"] as? String
TwitchAuthorizationManager.sharedInstance.clientSecret = configuration["clientSecret"] as? String
if !TwitchAuthorizationManager.sharedInstance.hasOAuthToken() {
    do {
        try TwitchAuthorizationManager.sharedInstance.login()
    } catch AuthorizationError.invalidURLResponse(let url) {
        NSLog("error thrown: \(url)")
    } catch AuthorizationError.unableToParseJSON(let json) {
        NSLog(json)
    } catch AuthorizationError.invalidQueryParameters(let d) {
        NSLog(d)
    } catch AuthorizationError.invalidAuthURL(let d, let url) {
        NSLog("\(d), url: \(url)")
    } catch AuthorizationError.unknownError(let e) {
        NSLog(e.localizedDescription)
    } catch {
        NSLog("unknown exception occured")
    }
} else {
    NSLog("OAuth Token exists, no need to authorize")
}

//Add the following inside of the app delegate:
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    if url.host == yourURLScheme {
        TwitchAuthorizationManager.sharedInstance.processOauthResponse(with: url,
            completion: { (result) in
                switch result {
                case let .failure(error):
                    switch error {
                    case let AuthorizationError.invalidAuthURL(desc, url):
                        NSLog(desc + url)
                    case let AuthorizationError.invalidQueryParameters(desc):
                        NSLog(desc)
                    case let AuthorizationError.invalidURLResponse(url):
                        NSLog("\(url)")
                    case let AuthorizationError.noCode(desc):
                        NSLog(desc)
                    case let AuthorizationError.unableToParseJSON(json):
                        NSLog(json)
                    case let AuthorizationError.unknownError(error):
                        NSLog(error.localizedDescription)
                    case ParsingError.cannotParseJSONArray:
                        NSLog("Error parsing JSON Array")
                    case ParsingError.invalidJSONData:
                        NSLog("Invalid JSON Data")
                    case ParsingError.cannotParseJSONDictionary:
                        NSLog("Error parsing JSON Dictionary")
                    case ParsingError.unsupportedType:
                        NSLog("Type you are trying to parse is currently unsupported")
                    case let NetworkJSONServiceError.networkError(error):
                        NSLog(error.localizedDescription)
                    case NetworkJSONServiceError.noData:
                        NSLog("No data returned")
                    default:
                        NSLog("Unknown error occurred")
                    }
                    //case let .success(credentials)
                case .success(_):
                    //returns credential object; however, values are stored securly in keychain and can be accessed as:
                    print(TwitchAuthorizationManager.sharedInstance.authToken)
                }
            }
        )
    }
    return true
}
```

##### Access Models
 
```Swift
//Set the presenter object for the  model you want to display
fileprivate lazy var userPresenter: UserPresenter = {
    return UserPresenter(dataSource: self)
}()

//Call the presenter
userPresenter.get(user: "test_user1")

//Extend the DataSource for the Model you want to display
extension ViewController: UserPresenterDataSource {
    func startLoading() {
        NSLog("Started Loading")
    }
    
    func finishLoading() {
        NSLog("Finished Loading")
    }
    
    func set(user: User?) {
        print(user?.displayName)
    }
    
    func handle(error: Error) {
        NSLog("Error")
    }
}
```

