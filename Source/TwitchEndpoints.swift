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
    
    var path: String {
        switch self {
        case .leaderboard:      return "helix/bits/leaderboard"
        case .clips:            return "helix/clips"
        case .games:            return "/helix/games"
        case .streams:          return "helix/streams"
        case .streamsMetadata:  return "helix/streams/metadata"
        case .topGames:         return "helix/games/top"
        case .userFollows:      return "helix/users/follows"
        case .users:            return "helix/users"
        case .videos:           return "helix/videos"
        }
    }
}
