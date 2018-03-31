//
//  UserNew.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

class UserWrapper: Codable {
    let users: [UserNew]
    
    private enum CodingKeys: String, CodingKey {
        case users = "data"
    }
}

public class UserNew: Codable {
    let id: String
    let login: String
    let displayName: String
    let type: String
    let broadcasterType: String
    let description: String
    let profileImageURL: URL
    let offlineImageURL: URL
    let viewCount: Int
    let email: String?
    
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
