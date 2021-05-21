//
//  ReplaceStreamTagRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

public struct ReplaceStreamTagRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    public let data: Data
    
    public init(broadcasterID: String, tagIDs: [String]? = nil) throws {
        self.url = TwitchEndpoints.redeemCode.construct()?.appending(queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
        self.data = try JSONSerialization.data(
            withJSONObject: ["tag_ids": tagIDs],
            options: [])
    }
}
