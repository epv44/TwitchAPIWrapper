//
//  DropsEntitlementRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/8/21.
//

import Foundation

/// Drops Entitlements Request: https://dev.twitch.tv/docs/api/reference/#get-drops-entitlements
public struct DropsEntitlementRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        id: String? = nil,
        userID: String? = nil,
        gameID: String? = nil,
        after: String? = nil,
        first: String? = nil
    ) {
    self.url = TwitchEndpoints.dropsEntitlements.construct()?.appending(
            queryItems: [
                "id": id,
                "user_id": userID,
                "game_id": gameID,
                "after": after,
                "first": first
            ].buildQueryItems())
    }
}
