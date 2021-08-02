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
| Redeem Code | RedeemCodeRequest | CodeStatusResponse | ✅ |
| Create EventSub Subscription | EventSubscriptionRequest |  EventSubscriptionResponse | ✅ |
| Delete EventSub Subscription | DeleteEventSubSubscriptionRequest | EmptyResponse | ✅ |
| Get EventSub Subscription | GetEventSubSubscriptionRequest | EventSubscriptionResponse | ✅ |
| Get Top Games | TopGameRequest | ✅ |
| Get Games | GameRequest | ✅ |
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
| Get Users | UserRequest  | ✅ |
| Update User | UserUpdateRequest | ✅ |
| Get User Follows | UserFollowRequest  | ✅ |
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
| End Prediction | EndPredictionRequest | EndPredictionResponse | Not Supported |
| Create Prediction | CreatePredictionRequest | CreatePredictionResponse | Not Supported |
| Get Predictions | GetPredictionRequest | GetPredictionResponse | Not Supported |
| End Poll | EndPollRequest | EndPollResponse | NotSupported |
| Create Poll | CreatePollRequest | CreatePollResponse | NotSupported |
| Get Polls | GetPollRequest | GetPollResponse | NotSupported |


## Author

epv44, epv9@case.edu

## License

TwitchAPIWrapper is available under the MIT license. See the LICENSE file for more info.
