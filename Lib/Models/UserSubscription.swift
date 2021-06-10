//
//  UserSubscription.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/17/21.
//

import Foundation

/// Response object for API request: https://dev.twitch.tv/docs/api/reference/#check-user-subscription
public struct UserSubscriptionResponse: Codable, Equatable {
    public let subscribed: [UserSubscription]?
    public let error: String?
    public let errorMessage: String?
    public let status: Int?
    
    private enum CodingKeys: String, CodingKey {
        case error
        case subscribed = "data"
        case errorMessage = "message"
        case status
    }
}

/// User subscription portion of the response object from https://dev.twitch.tv/docs/api/reference/#check-user-subscription
public struct UserSubscription: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterName: String
    public let broadcasterLogin: String
    public let isGift: Bool
    public let tier: String
}
