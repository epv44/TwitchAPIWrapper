//
//  UpdateEntitlement.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 8/3/21.
//

import Foundation

/// Response Object for https://dev.twitch.tv/docs/api/reference/#update-drops-entitlements
public struct UpdateEntitlementResponse: Codable {
    public let data: [UpdatedEntitlement]
}

/// Represents the status of the updated entitlements as part of the `UpdateEntitlementsResponse` object
public enum UpdatedEntitlementStatus: String, Codable {
    case success = "SUCCESS"
    case invalidID = "INVALID_ID"
    case notFound = "NOT_FOUND"
    case unauthorized = "UNAUTHORIZED"
    case updateFailed = "UPDATE_FAILED"
}

/// Specific updated entitlement object as part of the `UpdateEntitlementResponse` object from Twitch: https://dev.twitch.tv/docs/api/reference/#update-drops-entitlements
public struct UpdatedEntitlement: Codable, Equatable {
    public let ids: [String]
    public let status: UpdatedEntitlementStatus
}
