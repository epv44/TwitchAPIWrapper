//
//  HypeTrainEvent.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct HypeTrainEventResponse: Codable {
    public let hypeTrainEvents: [HypeTrainEvent]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case hypeTrainEvents = "data"
        case pagination
    }
}

public enum HypeTrainContributionType: String, Codable {
    case bits = "BITS"
    case subs = "SUBS"
}

public struct HypeTrainEventContribution: Codable, Equatable {
    public let total: Int
    public let type: HypeTrainContributionType
    public let user: String
}

public struct HypeTrainEventData: Codable, Equatable {
    public let id: String
    public let broadcasterId: String
    public let startedAt: Date
    public let expiresAt: Date
    public let cooldownEndTime: Date
    public let level: Int
    public let goal: Int
    public let total: Int
    public let lastContribution: HypeTrainEventContribution
}


public struct HypeTrainEvent: Codable, Equatable {
    public let id: String
    public let eventType: String
    public let eventTimestamp: Date
    public let version: String
    public let eventData: HypeTrainEventData
    public let topContributions: [HypeTrainEventContribution]
    public let level: Int
    public let startedAt: Date
    public let total: Int
}
