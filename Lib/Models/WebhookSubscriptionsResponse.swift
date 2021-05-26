//
//  File.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/25/21.
//

import Foundation

public struct WebhookSubscriptionResponse: Codable, Equatable {
    public let total: Int
    public let subscriptions: [WebhookSubscription]
    public let pagination: Paginate?
    
    private enum CodingKeys: String, CodingKey {
        case total
        case subscriptions = "data"
        case pagination = "message"
    }
}

public struct WebhookSubscription: Codable, Equatable {
    public let topic: String
    public let callback: String
    public let expiresAt: Date
}
