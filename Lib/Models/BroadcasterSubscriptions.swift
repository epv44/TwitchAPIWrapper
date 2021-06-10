//
//  BroadcasterSubscriptions.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

/// API response object for https://dev.twitch.tv/docs/api/reference/#get-broadcaster-subscriptions
public struct BroadcasterSubscriptionsResponse: Codable {
    public let broadcasterSubscriptions: [BroadcasterSubscription]
    public let pagination: Paginate?
    public let total: Int

    private enum CodingKeys: String, CodingKey {
        case broadcasterSubscriptions = "data"
        case pagination
        case total
    }
}

/// Object representing the subscriptions as part of the `BroadcasterSubscriptionsResponse` https://dev.twitch.tv/docs/api/reference/#get-broadcaster-subscriptions
public struct BroadcasterSubscription: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let gifterId: String
    public let gifterLogin: String
    public let gifterName: String
    public let isGift: Bool
    public let tier: String
    public let planName: String
    public let userId: String
    public let userName: String
    public let userLogin: String
}
