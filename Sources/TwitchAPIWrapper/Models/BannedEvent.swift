//
//  BannedEvent.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct BannedEventsResponse: Codable {
    public let bannedEvents: [BannedEvent]
    public let pagination: Paginate

    private enum CodingKeys: String, CodingKey {
        case bannedEvents = "data"
        case pagination
    }
}

public struct BannedEventData: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let userId: String
    public let userLogin: String
    public let userName: String
    public let expiresAt: String
}

public struct BannedEvent: Codable, Equatable {
    public let id: String
    public let eventType: String
    public let eventTimestamp: Date
    public let version: String
    public let eventData: BannedEventData
}
