//
//  Team.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

/// Response Object for https://dev.twitch.tv/docs/api/reference/#get-teams
public struct TeamResponse: Codable {
    public let teams: [Team]

    private enum CodingKeys: String, CodingKey {
        case teams = "data"
    }
}

/// Type as part of the `TeamResponse` object from Twitch: https://dev.twitch.tv/docs/api/reference/#get-teams
public struct TeamUser: Codable, Equatable {
    public let userId: String
    public let userName: String
    public let userLogin: String
}

/// Specific team object as part of the `TeamResponse` object from Twitch: https://dev.twitch.tv/docs/api/reference/#get-teams
public struct Team: Codable, Equatable {
    public let users: [TeamUser]
    public let backgroundImageUrl: String?
    public let banner: String?
    public let createdAt: Date
    public let updatedAt: Date
    public let info: String
    public let thumbnailUrl: URL
    public let teamName: String
    public let id: String
    public let teamDisplayName: String
}
