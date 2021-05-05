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
    case channelEditor
    case channelInformation
    case clips
    case cheermotes
    case extensionTransactions
    case games
    case gameAnalytics
    case leaderboard
    case startCommercial
    case streams
    case topGames
    case userFollows
    case users
    case videos
    
    var path: String {
        switch self {
        case .analyticsExtension:       return "helix/analytics/extensions"
        case .authentication:           return "oauth2/authorize"
        case .channelEditor:            return "helix/channels/editors"
        case .channelInformation:       return "helix/channels"
        case .clips:                    return "helix/clips"
        case .cheermotes:               return "helix/bits/cheermotes"
        case .extensionTransactions:    return "helix/extensions/transactions"
        case .games:                    return "helix/games"
        case .gameAnalytics:            return "helix/analytics/games"
        case .leaderboard:              return "helix/bits/leaderboard"
        case .startCommercial:          return "helix/channels/commercial"
        case .streams:                  return "helix/streams"
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
             .channelEditor:
            return "https://api.twitch.tv/"
        case .authentication:
            return "https://id.twitch.tv/"
        }
    }
    
    func construct() -> URL? {
        return URL(string: self.host + self.path)
    }
}

