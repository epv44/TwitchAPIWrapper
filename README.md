# TwitchAPIWrapper

[![CI Status](https://img.shields.io/travis/epv44/TwitchAPIWrapper.svg?style=flat)](https://travis-ci.org/epv44/TwitchAPIWrapper)
[![Version](https://img.shields.io/cocoapods/v/TwitchAPIWrapper.svg?style=flat)](https://cocoapods.org/pods/TwitchAPIWrapper)
[![License](https://img.shields.io/cocoapods/l/TwitchAPIWrapper.svg?style=flat)](https://cocoapods.org/pods/TwitchAPIWrapper)
[![Platform](https://img.shields.io/cocoapods/p/TwitchAPIWrapper.svg?style=flat)](https://cocoapods.org/pods/TwitchAPIWrapper)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TwitchAPIWrapper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TwitchAPIWrapper'
```

## Available API Calls

| Twitch API Method | Swift Request Object | Supported? |
| ------------- | ------------- | :-------------: |
| Start Commercial | CommercialRequest | ✅ |
| Get Extension Analytics | StartCommercialRequest | ✅ |
| Get Game Analytics | GameAnalyticsRequest | ✅ |
| Get Bits Leaderboard | LeaderboardRequest | ✅ |
| Get Cheermotes |CheermoteRequest | ✅ |
| Get Extension Transactions | ExtensionTransactionsRequest | ✅ |
| Get Channel Information | ChannelInformationRequest | ✅ |
| Modify Channel Information | ModifyChannelInformationRequest  | ✅ |
| Get Channel Editors | ChannelEditorsRequest | ✅ |
| Create Custom Rewards | CreateCustomAwardRequest  | ✅ |
| Delete Custom Reward | | ❌ |
| Get Custom Reward | | ❌ |
| Get Custom Reward | | ❌ |
| Get Custom Reward Redemption | | ❌ |
| Update Custom Reward | | ❌ |
| Update Redemption Status | | ❌ |
| Create Clip |  | ❌ |
| Get Clips | ClipRequest | ✅ |
| Get Code Status | | ❌ |
| Get Drops Entitlements | | ❌ |
| Redeem Code | | ❌ |
| Create EventSub Subscription |  | ❌ |
| Delete EventSub Subscription |  | ❌ |
| Get EventSub Subscription | | ❌ |
| Get Top Games | TopGameRequest | ✅ |
| Get Games | GameRequest | ✅ |
| Get Hype Train Events |  | ❌ |
| Check AutoMod Status |  | ❌ |
| Get Banned Events |  | ❌ |
| Get Banned Users |  | ❌ |
| Get Moderators |  | ❌ |
| Get Moderator Events |  | ❌ |
| Search Categories |  | ❌ |
| Search Channels |  | ❌ |
| Get Stream Key |  | ❌ |
| Get Streams |  StreamRequest | ✅ |
| Get Followed Streams |  | ✅ |
| Create Stream Marker |  | ❌ |
| Get Stream Markers |  | ❌ |
| Get Broadcaster Subscriptions |  | ❌ |
| Check User Subscription |  | ❌ |
| Get All Stream Tags |  | ❌ |
| Get Stream Tags |  | ❌ |
| Replace Stream Tags|  | ❌ |
| Get Channel Teams |  | ❌ |
| Get Teams |  | ❌ |
| Get Users | UserRequest  | ✅ |
| Update User | UserUpdateRequest | ✅ |
| Get User Follows | UserFollowRequest  | ✅ |
| Create User Follows |  | ❌ |
| Delete User Follows |  | ❌ |
| Get User Block List |  | ❌ |
| Block User |  | ❌ |
| Unblock User |  | ❌ |
| Get User Extensions |  | ❌ |
| Get User Active Extensions |  | ❌ |
| Update User Extension|  | ❌ |
| Get Videos |  | ✅ |
| Delete Videos |  | ❌ |
| Get Webhook Subscriptions | | ❌ |

## Author

epv44, epv9@case.edu

## License

TwitchAPIWrapper is available under the MIT license. See the LICENSE file for more info.
