//
//  UserUpdateRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/11/18.
//

import Foundation

public struct UserUpdateRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .put
    
    public init(description: String) {
        self.url = TwitchEndpoints.users.construct()?.appending(queryItems: ["description":description].buildQueryItems())
    }
}

