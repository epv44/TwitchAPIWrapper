//
//  ChannelTeam.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

public struct ChannelTeamResponse: Codable {
    public let ChannelTeams: [ChannelTeam]

    private enum CodingKeys: String, CodingKey {
        case ChannelTeams = "data"
    }
}

public struct ChannelTeam: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let backgroundImageUrl: String?
    public let banner: String
    public let createdAt: String
    public let updatedAt: String
    public let info: String
    public let thumbnailUrl: URL
    public let teamName: String
    public let teamDisplayName: String
    public let id: String
}
