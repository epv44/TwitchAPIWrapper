//
//  UserActiveExtensionsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

///Get user active extension request see https://dev.twitch.tv/docs/api/reference/#get-user-active-extensions
public struct UserActiveExtensionsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(userID: String? = nil) {
        self.url = TwitchEndpoints.userExtensions.construct()?.appending(queryItems: ["user_id": userID].buildQueryItems())
    }
}
