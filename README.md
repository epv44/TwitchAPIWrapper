# Twitch API Wrapper
[![CI Status](https://api.travis-ci.org/epv44/TwitchAPIWrapper.svg)](https://travis-ci.org/epv44/TwitchAPIWrapper)
[![Version](https://img.shields.io/cocoapods/v/TwitchAPIWrapper.svg?style=flat)](http://cocoapods.org/pods/TwitchAPIWrapper)
[![License](https://img.shields.io/cocoapods/l/TwitchAPIWrapper.svg?style=flat)](http://cocoapods.org/pods/TwitchAPIWrapper)
[![Platform](https://img.shields.io/cocoapods/p/TwitchAPIWrapper.svg?style=flat)](http://cocoapods.org/pods/TwitchAPIWrapper)
[![codecov](https://codecov.io/gh/epv44/TwitchAPIWrapper/branch/master/graph/badge.svg)](https://codecov.io/gh/epv44/TwitchAPIWrapper)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)][carthageLink]

## About
The Twitch API Wrapper is an HTTP Client for the Twitch API that includes Object mappings to the different Twitch endpoints that can be easily displayed utilizing the provided DataSources.  The library also contains an OAuth Client allowing access to Twitch's secure endpoints as well as OAuth for your application.

## Current Progress
* Created Presenter Object for the User Twitch Endpoint.
* Created Presenter Object for the Emote Twitch Endpoint.
* Implemented OAuth client.
* Created sample application.  

## TODO
* Build out models/presenters for other endpoints.
* Improve sample app to show an example of connecting to all of the endpoints.
* Test Coverage.
* Swift Package Manager Connections.
* Carthage build in travis-ci.
* Improve code coverage.
* Build tvOS target and example project.
* Build macOS target and example project.
* Add Lenses for Models

## Requirements
* Swift 3.0+
* iOS 10.0 +

## Installation

#### [CocoaPods][podLink]

```ruby
pod "TwitchAPIWrapper"
```

#### [Carthage][carthageLink]

```Bash
github epv44/TwitchAPIWrapper
```

## Documentation
Read the [docs][docsLink]. Generated with [jazzy](https://github.com/realm/jazzy)

## Getting Started

```Swift
import TwitchAPIWrapper
```

### Design
This library has two main sections

1. Authorization - Utilizing the Twitch OAuth protocol inside of your application.
2. Presenter Objects - Present the provided Model Objects that correspond to Twitch API endpoints.

### Example

The following example illustrates how to setup the OAuth components and utilize the Presenter Object (DataSources) to retrieve models.

#### Twitch OAuth
Important: Prior to authorization ensure:

1. Add a URL Type and specify the matching URL Scheme for Twitch.
2. Set the proper clientID, redirectURI, scopes, and clientSecret as they are necessary for successful authentication.
3. It is recommended not to leave any of the above in version control, as you can see from the sample application.

```Swift
// OAuth setup can be placed wherever you wish; however, as in the example project it is placed inside of the AppDelegate so
// that authorization is done when the application is first loaded.
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

//Add the following function to the AppDelegate:
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
                    //returns credential object; however, values are stored securely in the Keychain and can be accessed as:
                    print(TwitchAuthorizationManager.sharedInstance.authToken)
                }
            }
        )
    }
    return true
}
```
The ```TwitchAuthorizationManager``` is a singleton, utilize the shared instance to access the following properties returned from authentication with Twitch:

1. Refresh Token: ```TwitchAuthorizationManager.sharedInstance.refreshToken```
2. Authentication Token: ```TwitchAuthorizationManager.sharedInstance.authToken```
3. Scopes: ```TwitchAuthorizationManager.sharedInstance.scopes```


#### Access Models
 
```Swift
//Set the presenter object for the Model you want to display
fileprivate lazy var userPresenter: UserPresenter = {
    return UserPresenter(dataSource: self)
}()

//Call the presenter's get method, in this case the user parameter is the name of the user you wish to retrieve
userPresenter.get(user: "test_user1")

//Extend the TwitchAPIDataSource
extension UserViewController: TwitchAPIDataSource {
    public func set<T>(resource: T) {
        if let user = resource as? User {
            print(user.displayName)
        } else {
            NSLog("Invalid Generic Resource")
        }
    }
    
    func startLoading(for resource: TwitchResource) {
        NSLog("Started Loading: \(resource)")
    }
    
    func finishLoading(for resource: TwitchResource) {
        NSLog("Finished Loading: \(resource)")
    }
    
    func handle(error: Error) {
        NSLog("Error")
    }
}
```

### Example Project
The included example project includes a more detailed implementation of all usable Models and a full OAuth setup.

## Currently Supported Models
### User 
`UserPresenter`

Endpoints:

1. GET /users/:user
2. GET /user (requires Authorization)

### Emote 
`EmotePresenter`

Endpoint:

1. GET /users/:user/emotes (requires Authorization)

## Unit Tests
There are unit tests included with this project which may also be helpful to review when trying to better understand the library.

## Contribute
Please feel free to contribute as long as you follow the coding format of the rest of the project.

## Author

Eric Vennaro, epv9@case.edu

## License

EVSlidingTableViewCell is available under the [MIT License][mitLink]. See the LICENSE file for more info.
>**Copyright &copy; 2016-present Eric Vennaro.**

[podLink]:http://cocoapods.org
[carthageLink]:https://github.com/Carthage/Carthage
[blogLink]:http://www.ericvennaro.com
[mitLink]:http://opensource.org/licenses/MIT
[docsLink]:https://epv44.github.io/docs/TwitchAPIWrapper/index.html