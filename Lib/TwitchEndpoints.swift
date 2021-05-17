//
//  TwitchEndpoints.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

enum TwitchEndpoints {
    case analyticsExtension
    case authentication
    case broadcasterSubscriptions
    case channelEditor
    case channelInformation
    case cheermotes
    case checkAutoModStatus
    case clips
    case codeStatus
    case createStreamMarker
    case customRewards
    case customRewardRedemption
    case dropsEntitlements
    case eventSubscription
    case extensionTransactions
    case followedStreams
    case games
    case gameAnalytics
    case getBannedEvents
    case getBannedUsers
    case getModerators
    case getModeratorEvents
    case manageHeldAutoModMessage
    case hypeTrainEvents
    case leaderboard
    case redeemCode
    case searchCategories
    case searchChannels
    case startCommercial
    case streams
    case streamKey
    case streamMarkers
    case topGames
    case userFollows
    case users
    case videos
    
    var path: String {
        switch self {
        case .analyticsExtension:       return "helix/analytics/extensions"
        case .authentication:           return "oauth2/authorize"
        case .broadcasterSubscriptions: return "/helix/subscriptions"
        case .channelEditor:            return "helix/channels/editors"
        case .channelInformation:       return "helix/channels"
        case .cheermotes:               return "helix/bits/cheermotes"
        case .checkAutoModStatus:       return "helix/moderation/enforcements/status"
        case .clips:                    return "helix/clips"
        case .codeStatus:               return "helix/entitlements/codes"
        case .createStreamMarker:       return "helix/streams/markers"
        case .customRewards:            return "helix/channel_points/custom_rewards"
        case .customRewardRedemption:   return "helix/channel_points/custom_rewards/redemptions"
        case .dropsEntitlements:        return "helix/entitlements/drops"
        case .eventSubscription:        return "helix/eventsub/subscriptions"
        case .extensionTransactions:    return "helix/extensions/transactions"
        case .followedStreams:          return "helix/streams/followed"
        case .games:                    return "helix/games"
        case .gameAnalytics:            return "helix/analytics/games"
        case .getBannedEvents:          return "helix/moderation/banned/events"
        case .getBannedUsers:           return "helix/moderation/banned"
        case .getModerators:            return "helix/moderation/moderators"
        case .getModeratorEvents:       return "helix/moderation/moderators/events"
        case .hypeTrainEvents:          return "helix/hypetrain/events"
        case .leaderboard:              return "helix/bits/leaderboard"
        case .manageHeldAutoModMessage: return "helix/moderation/automod/message"
        case .redeemCode:               return "helix/entitlements/codes"
        case .startCommercial:          return "helix/channels/commercial"
        case .searchCategories:         return "helix/search/categories"
        case .searchChannels:           return "helix/search/channels"
        case .streams:                  return "helix/streams"
        case .streamKey:                return "helix/streams/key"
        case .streamMarkers:            return "helix/streams/markers"
        case .topGames:                 return "helix/games/top"
        case .userFollows:              return "helix/users/follows"
        case .users:                    return "helix/users"
        case .videos:                   return "helix/videos"
        }
    }
    
    var host: String {
        switch self {
        case .leaderboard,
             .clips,
             .games,
             .streams,
             .topGames,
             .userFollows,
             .users,
             .videos,
             .gameAnalytics,
             .startCommercial,
             .analyticsExtension,
             .cheermotes,
             .extensionTransactions,
             .channelInformation,
             .channelEditor,
             .customRewards,
             .customRewardRedemption,
             .codeStatus,
             .dropsEntitlements,
             .redeemCode,
             .eventSubscription,
             .hypeTrainEvents,
             .checkAutoModStatus,
             .manageHeldAutoModMessage,
             .getBannedEvents,
             .getBannedUsers,
             .getModerators,
             .getModeratorEvents,
             .searchCategories,
             .searchChannels,
             .followedStreams,
             .createStreamMarker,
             .streamKey,
             .streamMarkers,
             .broadcasterSubscriptions:
            return "https://api.twitch.tv/"
        case .authentication:
            return "https://id.twitch.tv/"
        }
    }
    
    func construct() -> URL? {
        return URL(string: self.host + self.path)
    }
}

