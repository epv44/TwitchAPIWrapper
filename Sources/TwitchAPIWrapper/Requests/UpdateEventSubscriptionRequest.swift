//
//  EventSubscriptionRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/12/21.
//

import Foundation

///Event subscription request see https://dev.twitch.tv/docs/api/reference/#create-eventsub-subscription for details
public struct UpdateEventSubscriptionRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    public let data: Data
    
    public init(
        type: String,
        version: String,
        condition: [String:String],
        transport: [String:String]
    ) throws {
        self.url = TwitchEndpoints.eventSubscription.construct()
        self.data = try JSONSerialization.data(
            withJSONObject: ["type": type, "version": version, "condition": condition, "transport": transport],
            options: [])
    }
}
