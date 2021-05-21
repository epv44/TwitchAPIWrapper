//
//  Team.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

public struct TeamResponse: Codable {
    public let teams: [Team]

    private enum CodingKeys: String, CodingKey {
        case teams = "data"
    }
}

public struct TeamUser: Codable, Equatable {
    public let userId: String
    public let userName: String
    public let userLogin: String
}

public struct Team: Codable, Equatable {
    public let users: [TeamUser]
    public let backgroundImageUrl: String?
    public let banner: String?
    public let createdAt: Date
    public let updatedAt: Date
    public let info: String
    public let thumbnailUrl: String
    public let teamName: String
    public let id: String
}
