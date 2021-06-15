//
//  GetModeratorsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///Get Moderators request see https://dev.twitch.tv/docs/api/reference/#get-moderators
public struct GetModeratorsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        broadcasterID: String,
        userIDs: [String]? = nil,
        after: String? = nil,
        first: String? = nil
    ) {
        var queryItems = userIDs?.constructQueryItems(withKey: "user_id") ?? [URLQueryItem]()
        queryItems.append(contentsOf: ["broadcaster_id": broadcasterID, "after": after, "first": first].buildQueryItems())
        self.url = TwitchEndpoints.getModerators.construct()?.appending(queryItems: queryItems)
    }
}
