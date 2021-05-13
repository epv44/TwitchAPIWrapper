//
//  ExtensionAnalytics.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

public struct ExtensionAnalyticsResponse: Codable {
    public let extensionAnalytics: [ExtensionAnalytics]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case extensionAnalytics = "data"
        case pagination
    }
}

public struct ExtensionAnalytics: Codable, Equatable {
    public let endedAt: String
    public let extensionId: String
    public let startedAt: String
    public let type: String
    public let url: URL
}
