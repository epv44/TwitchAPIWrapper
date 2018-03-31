//
//  UserFollow.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public class UserFollow: Codable {
    let total: Int
    let follows: [Follow]
    let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case total
        case follows = "data"
        case pagination
    }
}

public class Follow: Codable {
    let fromId: String
    let toId: String
    let followedAt: Date
    
    private enum CodingKeys: String, CodingKey {
        case fromId = "from_id"
        case toId = "to_id"
        case followedAt = "followed_at"
    }
}
