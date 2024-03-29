//
//  GetBannedUsersRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///Get banned users request see https://dev.twitch.tv/docs/api/reference/#get-banned-users
public struct GetBannedUsersRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        broadcasterID: String,
        userIDs: [String]? = nil,
        after: String? = nil,
        first: String? = nil,
        before: String? = nil
    ) {
        var queryItems = userIDs?.constructQueryItems(withKey: "user_id") ?? [URLQueryItem]()
        queryItems.append(contentsOf: [
                            "broadcaster_id": broadcasterID,
                            "after": after,
                            "first": first,
                            "before": before].buildQueryItems())
        self.url = TwitchEndpoints.getBannedUsers.construct()?.appending(queryItems: queryItems)
    }
}
