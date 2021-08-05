//
//  UpdateUserExtensionsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/25/21.
//

import Foundation

///Update user extension request see https://dev.twitch.tv/docs/api/reference/#update-user-extensions
///Because the data object is complicate just pass in the data, this is in contrast to the other requests which serialize the data for you
public struct UpdateUserExtensionsRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .put
    public let data: Data
    
    public init(data: Data) {
        self.url = TwitchEndpoints.userActiveExtensions.construct()
        self.data = data
    }
}
