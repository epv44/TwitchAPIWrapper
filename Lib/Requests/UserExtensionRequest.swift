//
//  UserExtensionRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

///Get user extension request see https://dev.twitch.tv/docs/api/reference/#get-user-extensions
public struct UserExtensionRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init() {
        self.url = TwitchEndpoints.userExtensions.construct()
    }
}
