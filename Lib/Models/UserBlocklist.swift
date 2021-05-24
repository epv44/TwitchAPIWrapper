//
//  UserBlocklist.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

public struct UserBlocklistResponse: Codable {
    public let blocklist: [BlockedUser]

    private enum CodingKeys: String, CodingKey {
        case blocklist = "data"
    }
}

public struct BlockedUser: Codable, Equatable {
    public let userId: String
    public let userLogin: String
    public let displayName: String
}
