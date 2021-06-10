//
//  ChannelTeam.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

public struct ChannelTeamResponse: Codable {
    public let channelTeams: [ChannelTeam]

    private enum CodingKeys: String, CodingKey {
        case channelTeams = "data"
    }
}

public struct ChannelTeam: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let backgroundImageUrl: String?
    public let banner: String?
    public let createdAt: Date
    public let updatedAt: Date
    public let info: String
    public let thumbnailUrl: URL
    public let teamName: String
    public let teamDisplayName: String
    public let id: String
}
