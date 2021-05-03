//
//  UserFollow.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct UserFollow: Codable, Equatable {
    let total: Int
    let follows: [Follow]
    let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case total
        case follows = "data"
        case pagination
    }
}

public struct Follow: Codable, Equatable {
    let followedAt: String
    let fromId: String
    let fromLogin: String
    let fromName: String
    let toId: String
    let toLogin: String
    let toName: String
}
