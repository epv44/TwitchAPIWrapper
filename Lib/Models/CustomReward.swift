//
//  CustomReward.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation
public struct MaxPerStreamSetting: Codable, Equatable {
    public let isEnabled: Bool
    public let maxPerStream: Int
}

public struct MaxPerUserPerStreamSetting: Codable, Equatable {
    public let isEnabled: Bool
    public let maxPerUserPerStream: Int
}

public struct GlobalCooldownSetting: Codable, Equatable {
    public let isEnabled: Bool
    public let globalCooldownSeconds: Int
}

public struct CustomAwardResponse: Codable {
    public let customAwards: [CustomReward]

    private enum CodingKeys: String, CodingKey {
        case customAwards = "data"
    }
}

public struct CustomReward: Codable, Equatable {
    public let broadcasterName: String
    public let broadcasterLogin: String
    public let broadcasterId: String
    public let id: String
    public let image: [String:String]?
    public let backgroundColor: String
    public let isEnabled: Bool
    public let cost: Int
    public let title: String
    public let prompt: String
    public let isUserInputRequired: Bool
    public let isPaused: Bool
    public let isInStock: Bool
    public let defaultImage: [String:String]
    public let shouldRedemptionsSkipRequestQueue: Bool
    public let redemptionsRedeemedCurrentStream: Int?
    public let cooldownExpiresAt: String?
    public let maxPerStreamSetting: MaxPerStreamSetting
    public let maxPerUserPerStreamSetting: MaxPerUserPerStreamSetting
    public let globalCooldownSetting: GlobalCooldownSetting
}
