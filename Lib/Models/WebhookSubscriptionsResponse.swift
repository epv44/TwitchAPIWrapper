//
//  WebhookSubscription.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/25/21.
//

import Foundation

///WebhookSubscriptionResponse object see: https://dev.twitch.tv/docs/api/reference/#get-webhook-subscriptions
public struct WebhookSubscriptionResponse: Codable, Equatable {
    public let total: Int
    ///List of `WebhookSubscription`'s returned
    public let subscriptions: [WebhookSubscription]
    ///Pagination cursor information
    public let pagination: Paginate?
    
    private enum CodingKeys: String, CodingKey {
        case total
        case subscriptions = "data"
        case pagination = "pagination"
    }
}

///WebhookSubscription as part of the WebhookSubscriptionResponse object: https://dev.twitch.tv/docs/api/reference/#get-webhook-subscriptions
public struct WebhookSubscription: Codable, Equatable {
    public let topic: String
    public let callback: String
    public let expiresAt: Date
}
