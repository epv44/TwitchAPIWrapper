//
//  DeleteEventSubSubscription.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/13/21.
//

import Foundation

///Event subscription request see https://dev.twitch.tv/docs/api/reference/#delete-eventsub-subscription for details
public struct DeleteEventSubSubscriptionRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .delete
    
    public init(
        id: String
    ) {
        self.url = TwitchEndpoints.eventSubscription.construct()?.appending(queryItems: ["id": id].buildQueryItems())
    }
}
