//
//  Entitlement.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/8/21.
//

import Foundation

/// Response object from the twitch api modeling Entitlements: https://dev.twitch.tv/docs/api/reference/#get-drops-entitlements
public struct EntitlementResponse: Codable {
    public let entitlements: [Entitlement]
    public let pagination: Paginate?

    private enum CodingKeys: String, CodingKey {
        case entitlements = "data"
        case pagination
    }
}

public enum EntitlementFulfillmentStatus: String, Codable {
    case claimed = "CLAIMED"
    case fulfilled = "FULFILLED"
}

/// Entitlement objects as part of the `EntitlementResponse` from the    server: https://dev.twitch.tv/docs/api/reference/#get-drops-entitlements
public struct Entitlement: Codable, Equatable {
    public let id: String
    public let benefitId: String
    public let timestamp: Date
    public let userId: String
    public let gameId: String
    public let fulfillmentStatus: EntitlementFulfillmentStatus
    public let updatedAt: Date
}
