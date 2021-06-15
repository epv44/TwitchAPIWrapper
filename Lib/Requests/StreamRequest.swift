//
//  StreamResource.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

///Get streams request https://dev.twitch.tv/docs/api/reference/#get-streams for details
public struct StreamRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        after: String? = nil,
        before: String? = nil,
        first: String? = nil,
        gameIDs: [String]? = nil,
        languages: [String]? = nil,
        userIDs: [String]? = nil,
        userLogins: [String]? = nil,
        tagID: String? = nil
    ) {
        var queryParams = [
            "after": after,
            "before": before,
            "first": first,
            "tag_id": tagID].buildQueryItems()
        queryParams.append(contentsOf: userIDs?.constructQueryItems(withKey: "user_id") ?? [])
        queryParams.append(contentsOf: gameIDs?.constructQueryItems(withKey: "game_id") ?? [] )
        queryParams.append(contentsOf: languages?.constructQueryItems(withKey: "language") ?? [])
        queryParams.append(contentsOf: userLogins?.constructQueryItems(withKey: "user_login") ?? [])
        self.url = TwitchEndpoints.streams.construct()?.appending(queryItems: queryParams)
    }
}
