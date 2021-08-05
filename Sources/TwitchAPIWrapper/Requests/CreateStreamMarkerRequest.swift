//
//  CreateStreamMarkerRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

/// Create stream marker request, see https://dev.twitch.tv/docs/api/reference/#create-stream-marker
public struct CreateStreamMarkerRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    public let data: Data
    
    public init(userID: String, description: String? = nil) throws {
        self.url = TwitchEndpoints.createStreamMarker.construct()
        var body = ["user_id": userID]
        if let d = description {
            body["description"] = d
        }
        self.data = try JSONSerialization.data(withJSONObject: body, options: [])
    }
}
