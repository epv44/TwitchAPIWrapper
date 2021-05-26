//
//  UpdateUserExtensionsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/25/21.
//

import Foundation

///Update user extension request see https://dev.twitch.tv/docs/api/reference/#update-user-extensions
public struct UpdateUserExtensionsRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .put
    public let data: Data
    
    public init(data: Data) {
        self.url = TwitchEndpoints.userExtensions.construct()
        self.data = data
    }
}
