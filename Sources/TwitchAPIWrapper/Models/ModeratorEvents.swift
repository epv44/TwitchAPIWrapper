//
//  ModeratorEvent.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation


public struct ModeratorEventsResponse: Codable {
    public let moderatorEvents: [ModeratorEvent]
    public let pagination: Paginate

    private enum CodingKeys: String, CodingKey {
        case moderatorEvents = "data"
        case pagination
    }
}

public struct ModeratorEventData: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let userId: String
    public let userLogin: String
    public let userName: String
}

public struct ModeratorEvent: Codable, Equatable {
    public let id: String
    public let eventType: String
    public let eventTimestamp: Date
    public let version: String
    public let eventData: ModeratorEventData
}
