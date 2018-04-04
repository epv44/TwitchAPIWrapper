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

class UserWrapper: Codable {
    let users: [User]
    
    private enum CodingKeys: String, CodingKey {
        case users = "data"
    }
}

public class User: Codable {
    public let id: String
    public let login: String
    public let displayName: String
    public let type: UserType
    public let broadcasterType: BroadcasterType
    public let description: String
    public let profileImageURL: URL
    public let offlineImageURL: URL
    public let viewCount: Int
    public let email: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case displayName = "display_name"
        case type
        case broadcasterType = "broadcaster_type"
        case description
        case profileImageURL = "profile_image_url"
        case offlineImageURL = "offline_image_url"
        case viewCount = "view_count"
        case email = "email"
    }
}
