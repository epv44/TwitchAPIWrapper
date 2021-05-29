//
//  WebhookSubscriptionsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/25/21.
//

import Foundation

///Get webhook subscriptions https://dev.twitch.tv/docs/api/reference/#get-webhook-subscriptions
public struct WebhookSubscriptionsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(after: String? = nil, first: String? = nil) {
        self.url = TwitchEndpoints.webhookSubscriptions.construct()?.appending(
            queryItems: ["after": after, "first": first].buildQueryItems())
    }
}
