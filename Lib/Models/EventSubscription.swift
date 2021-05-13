//
//  EventSubscription.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/12/21.
//

import Foundation

public struct EventSubscriptionResponse: Codable {
    public let events: [EventSubscription]
    public let limit: Int
    public let total: Int
    public let totalCost: Int
    public let maxTotalCost: Int
    public let pagination: Paginate?
    
    private enum CodingKeys: String, CodingKey {
        case events = "data"
        case limit
        case total
        case totalCost
        case maxTotalCost
        case pagination
    }
}

public struct EventSubscription: Codable, Equatable {
    public let id: String
    public let status: String
    public let type: String
    public let version: String
    public let condition: [String:String]
    public let createdAt: Date
    public let transport: [String:String]
    public let cost: Int
}
