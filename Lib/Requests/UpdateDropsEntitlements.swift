//
//  UpdateDropsEntitlements.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 8/3/21.
//

import Foundation

///Update Drops Entitlements: https://dev.twitch.tv/docs/api/reference/#update-drops-entitlements
public struct UpdateDropsEntitlementsRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .patch
    public let data: Data
    
    public init(entitlementIds: [String], fulfillmentStatus: String) throws {
        self.url = TwitchEndpoints.dropsEntitlements.construct()
        self.data = try JSONSerialization.data(
            withJSONObject: ["entitlement_ids": entitlementIds, "fulfillment_status": fulfillmentStatus],
            options: [])
    }
}
