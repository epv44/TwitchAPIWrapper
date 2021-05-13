//
//  Entitlement.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/8/21.
//

import Foundation

public struct EntitlementResponse: Codable {
    public let entitlements: [Entitlement]
    public let pagination: Paginate?

    private enum CodingKeys: String, CodingKey {
        case entitlements = "data"
        case pagination
    }
}

public struct Entitlement: Codable, Equatable {
    public let id: String
    public let benefitId: String
    public let timestamp: Date
    public let userId: String
    public let gameId: String
    
}
