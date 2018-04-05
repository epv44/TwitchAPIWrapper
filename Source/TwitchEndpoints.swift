//
//  TwitchEndpoints.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

enum TwitchEndpoints {
    case leaderboard
    case clips
    case games
    case streams
    case streamsMetadata
    case topGames
    case userFollows
    case users
    case videos
    case authentication
    case gameAnalytics
    
    var path: String {
        switch self {
        case .leaderboard:      return "helix/bits/leaderboard"
        case .clips:            return "helix/clips"
        case .games:            return "helix/games"
        case .gameAnalytics:    return "helix/analytics/games"
        case .streams:          return "helix/streams"
        case .streamsMetadata:  return "helix/streams/metadata"
        case .topGames:         return "helix/games/top"
        case .userFollows:      return "helix/users/follows"
        case .users:            return "helix/users"
        case .videos:           return "helix/videos"
        case .authentication:   return "oauth2/authorize"
        }
    }
    
    var host: String {
        switch self {
        case .leaderboard, .clips, .games, .streams, .streamsMetadata, .topGames,
             .userFollows, .users, .videos, .gameAnalytics:
            return "https://api.twitch.tv/"
        case .authentication:
            return "https://id.twitch.tv/"
        }
    }
    
    func construct() -> URL? {
        return URL(string: self.host + self.path)
    }
}
