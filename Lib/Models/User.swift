//
//  UserNew.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public enum BroadcasterType: String, Codable {
    case partner
    case affiliate
    case none = ""
}

public enum UserType: String, Codable {
    case staff
    case admin
    case globalMod = "global_mod"
    case none = ""
}

public struct UserResponse: Codable {
    public let users: [User]
    
    private enum CodingKeys: String, CodingKey {
        case users = "data"
    }
}

public struct User: Codable, Equatable {
    public let id: String
    public let login: String
    public let displayName: String
    public let type: UserType
    public let broadcasterType: BroadcasterType
    public let description: String
    @FailableDecodable
    public private(set) var profileImageUrl: URL?
    @FailableDecodable
    public private(set) var offlineImageUrl: URL?
    public let viewCount: Int
    public let email: String?
    public let createdAt: String
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
