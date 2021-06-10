//
//  UserFollow.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct UserFollowResponse: Codable, Equatable {
    public let total: Int
    public let follows: [Follow]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case total
        case follows = "data"
        case pagination
    }
}

public struct Follow: Codable, Equatable {
    public let followedAt: Date
    public let fromId: String
    public let fromLogin: String
    public let fromName: String
    public let toId: String
    public let toLogin: String?
    public let toName: String
}
