//
//  ExtensionAnalyticsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

///Get extension analytics request, see https://dev.twitch.tv/docs/api/reference/#get-extension-analytics for details
public struct ExtensionAnalyticsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        after: String? = nil,
        endedAt: String? = nil,
        extensionID: String? = nil,
        first: String? = nil,
        startedAt: String? = nil,
        type: String? = nil
    ) {
        self.url = TwitchEndpoints.analyticsExtension.construct()?.appending(
            queryItems: [
                "after": after,
                "ended_at": endedAt,
                "extension_id": extensionID,
                "first": first,
                "started_at": startedAt,
                "type": type
            ].buildQueryItems())
    }
}
