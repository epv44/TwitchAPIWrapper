//
//  BannedUsers.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct BannedUsersResponse: Codable {
    public let bannedUsers: [BannedUser]
    public let pagination: Paginate

    private enum CodingKeys: String, CodingKey {
        case bannedUsers = "data"
        case pagination
    }
}

public struct BannedUser: Codable, Equatable {
    public let userId: String
    public let userLogin: String
    public let userName: String
    public let expiresAt: Date
}
