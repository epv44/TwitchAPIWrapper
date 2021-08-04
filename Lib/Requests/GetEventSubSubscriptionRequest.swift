//
//  GetEventSubSubscriptionRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/13/21.
//

import Foundation

///Event subscription request see https://dev.twitch.tv/docs/api/reference/#get-eventsub-subscription for details
public struct GetEventSubSubscriptionRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        status: String? = nil,
        type: String? = nil
    ) {
        self.url = TwitchEndpoints.eventSubscription.construct()?.appending(
            queryItems: [
                "status": status,
                "type": type
            ].buildQueryItems())
    }
}
