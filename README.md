# TwitchAPIWrapper

[![CI Status](https://img.shields.io/travis/epv44/TwitchAPIWrapper.svg?style=flat)](https://travis-ci.com/epv44/TwitchAPIWrapper)
[![Version](https://img.shields.io/cocoapods/v/TwitchAPIWrapper.svg?style=flat)](https://cocoapods.org/pods/TwitchAPIWrapper)
[![License](https://img.shields.io/cocoapods/l/TwitchAPIWrapper.svg?style=flat)](https://cocoapods.org/pods/TwitchAPIWrapper)
[![Platform](https://img.shields.io/cocoapods/p/TwitchAPIWrapper.svg?style=flat)](https://cocoapods.org/pods/TwitchAPIWrapper)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Xcode 12.5+
* Swift 5+
* iOS 11.0+
## Installation
### CocoaPods
TwitchAPIWrapper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TwitchAPIWrapper'
```
### Swift Package Manager
Add `TwitchAPIWrapper` as a dependency, or [add via xcode](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app)
```
dependencies: [
    .package(url: "https://github.com/epv44/TwitchAPIWrapper.git", from: "1.0.0")
]
```
## Documentation
Read the [docs](https://epv44.github.io/docs/TwitchAPIWrapper/index.html) generated with Jazzy.
## How To User
See the available API calls for more details on what is supported. In general, make a request in the form of:
```
// Different requests have different params, everything mirrors the server requests
let userRequest = UserRequest(id: nil, login: ["evennaro1"])
  TwitchService().gen(forRequest: userRequest) { (result: Result<UserResponse>) in
    switch result {
    case .success(let r):
    print(r.users[0])
    case .failure(let error):
        print(error)
    }
}
```
See the example project for more details
## Available API Calls

| Twitch API Method | Swift Request Object | Swift Result Object | Supported? |
| ------------- | ------------- | ------------- | :-------------: |
| Start Commercial | CommercialRequest | CommercialResponse | ✅ |
| Get Extension Analytics | ExtensionAnalyticsRequest | ExtensionAnalyticsResponse | ✅ |
| Get Game Analytics | GameAnalyticsRequest | GameAnalyticsResponse | ✅ |
| Get Bits Leaderboard | LeaderboardRequest | LeaderboardResponse  | ✅ |
| Get Cheermotes | CheermoteRequest | CheermoteResponse | ✅ |
| Get Extension Transactions | ExtensionTransactionsRequest | ExtensionTransactionsResponse | ✅ |
| Get Channel Information | ChannelInformationRequest | ChannelInformationResponse | ✅ |
| Modify Channel Information | ModifyChannelInformationRequest | EmptyResponse | ✅ |
| Get Channel Editors | ChannelEditorsRequest | ChannelEditorResponse | ✅ |
| Create Custom Rewards | CustomRewardRequest  | CustomRewardResponse| ✅ |
| Delete Custom Reward | CustomRewardRequest  | EmptyResponse | ✅ |
| Get Custom Reward | CustomRewardRequest | CustomRewardResponse | ✅ |
| Get Custom Reward Redemption | CustomRewardRedemptionRequest | CustomRewardResponse | ✅ |
| Update Custom Reward | CustomRewardRequest | CustomRewardResponse | ✅ |
| Update Redemption Status | CustomRewardRedemptionRequest | CustomRewardResponse | ✅ |
| Create Clip | ClipRequest | CreateClipResponse | ✅ |
| Get Clips | ClipRequest | ClipResponse | ✅ |
| Get Code Status | CodeStatusRequest | CodeStatusResponse | ✅ |
| Get Drops Entitlements | DropEntitlementsRequest | EntitlementResponse | ✅ |
| Update Drops Entitlements | UpdateDropsEntitlementsRequest | UpdateEntitlementResponse| ✅ |
| Redeem Code | RedeemCodeRequest | CodeStatusResponse | ✅ |
| Create EventSub Subscription | EventSubscriptionRequest |  EventSubscriptionResponse | ✅ |
| Delete EventSub Subscription | DeleteEventSubSubscriptionRequest | EmptyResponse | ✅ |
| Get EventSub Subscription | GetEventSubSubscriptionRequest | EventSubscriptionResponse | ✅ |
| Get Top Games | TopGameRequest | GetGamesResponse | ✅ |
| Get Games | GameRequest | GetGamesResponse | ✅ |
| Get Hype Train Events | GetHypeTrainEventRequest | HypeTrainEventResponse  | ✅ |
| Check AutoMod Status | CheckAutoModStatusRequest | CheckAutoModeStatusResponse  | ✅ |
| Manage Held AutoMod Messages | ManageHeldAutoModStatusRequest | EmptyResponse | ✅ |
| Get Banned Events | GetBannedEventsRequest | BannedEventsResponse  | ✅ |
| Get Banned Users | GetBannedUsersRequest | BannedUsersResponse | ✅ |
| Get Moderators | GetModeratorsRequest | ModeratorsResponse | ✅ |
| Get Moderator Events | GetModeratorEventsRequest | ModeratorEventsResponse | ✅ |
| Search Categories | SearchCategoriesRequest | GamesResponse | ✅ |
| Search Channels | SearchChannelsRequest | SearchChannelResponse | ✅ |
| Get Stream Key | GetStreamKeyRequest | StreamKeyResponse | ✅ |
| Get Streams | StreamRequest | StreamResponse | ✅ |
| Get Followed Streams | FollowedStreamRequest | StreamResponse | ✅ |
| Create Stream Marker | CreateStreamMarkerRequest | CreateStreamMarkerResponse | ✅ |
| Get Stream Markers | GetStreamMarkerRequest | StreamMarkerResponse | ✅ |
| Get Broadcaster Subscriptions | BroadcasterSubscriptionRequest | BroadcasterSubscriptionResponse  | ✅ |
| Check User Subscription | CheckUserSubscriptionRequest | UserSubscriptionResponse  | ✅ |
| Get All Stream Tags | AllStreamTagRequest | StreamTagResponse | ✅ |
| Get Stream Tags | StreamTagRequest | StreamTagResponse | ✅ |
| Replace Stream Tags | ReplaceStreamTagRequest | EmptyResponse | ✅ |
| Get Channel Teams | ChannelTeamsRequest | ChannelTeamResponse | ✅ |
| Get Teams | TeamRequest | TeamResponse  | ✅ |
| Get Users | UserRequest | UserResponse | ✅ |
| Update User | UserUpdateRequest | UserResponse | ✅ |
| Get User Follows | UserFollowRequest | UserFollowResponse | ✅ |
| Create User Follows | ModifyUserFollowRequest | EmptyResponse | ✅ |
| Delete User Follows | ModifyUserFollowRequest | EmptyResponse | ✅ |
| Get User Block List | UserBlockListRequest | UserBlocklistResponse | ✅ |
| Block User | BlockUserRequest | EmptyRequest | ✅ |
| Unblock User | UnblockUserRequest | EmptyRequest | ✅ |
| Get User Extensions | UserExtensionRequest | UserExtensionResponse | ✅ |
| Get User Active Extensions | UserActiveExtensionsRequest | UserActiveExtensionResponse | ✅ |
| Update User Extension| UpdateUserExtensionsRequest | UserActiveExtensionResponse | ✅ |
| Get Videos | GetVideoRequest | GetVideoResponse | ✅ |
| Delete Videos | DeleteVideoRequest | DeleteVideoResponse | ✅ |
| Get Webhook Subscriptions | WebhookSubscriptionsRequest | WebhookSubscriptionsResponse | ✅ |
| End Prediction | EndPredictionRequest | EndPredictionResponse | ❌ |
| Create Prediction | CreatePredictionRequest | CreatePredictionResponse | ❌ |
| Get Predictions | GetPredictionRequest | GetPredictionResponse | ❌ |
| End Poll | EndPollRequest | EndPollResponse | ❌ |
| Create Poll | CreatePollRequest | CreatePollResponse | ❌ |
| Get Polls | GetPollRequest | GetPollResponse | ❌ |
| Get Extension Configuration | N/A | N/A | ❌ |
| Set Extension Configuration Segment | N/A | N/A | ❌ |
| Set Extension Required Configuration | N/A | N/A | ❌ |
| Send Extension PubSub Message | N/A | N/A | ❌ |
| Get Live Channels | N/A | N/A | ❌ |
| Get Extensions Secrets | N/A | N/A | ❌ |
| Create Extensions Secrets | N/A | N/A | ❌ |
| Send Extension Chat Message | N/A | N/A | ❌ |
| Get Extensions | N/A | N/A | ❌ |
| Get Released Extensions | N/A | N/A | ❌ |
| Get Extension Bits Products | N/A | N/A | ❌ |
| Update Extension Bits Product | N/A | N/A | ❌ |

## Author

epv44, epv9@case.edu

## License

TwitchAPIWrapper is available under the MIT license. See the LICENSE file for more info.
