//
//  ExtensionAnalytics.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

///Response object for ExtensionAnalytics Endpoint  see: https://dev.twitch.tv/docs/api/reference/#get-extension-analytics
public struct ExtensionAnalyticsResponse: Codable {
    public let extensionAnalytics: [ExtensionAnalytics]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case extensionAnalytics = "data"
        case pagination
    }
}

/// Individual ExtensionAnalytics object representing the individual data from the
/// ExtensionAnalytics Endpoint see: https://dev.twitch.tv/docs/api/reference/#get-extension-analytics
public struct ExtensionAnalytics: Codable, Equatable {
    public let extensionId: String
    public let type: String
    public let url: URL
    public let dateRange: EVDateRange
    
    private enum CodingKeys: String, CodingKey {
        case extensionId
        case type
        case url = "URL"
        case dateRange
    }
}
