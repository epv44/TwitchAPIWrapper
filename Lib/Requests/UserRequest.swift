//
//  UserRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

///Get users request https://dev.twitch.tv/docs/api/reference/#get-users for details
public struct UserRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(id: [String]? = nil, login: [String]? = nil) {
        self.url = TwitchEndpoints.users.construct()?.appending(queryItems: ["id":id as Any, "login":login as Any].buildQueryItems())
    }
}
