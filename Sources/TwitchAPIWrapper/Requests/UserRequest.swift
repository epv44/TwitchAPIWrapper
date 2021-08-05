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
        let idItems = id?.constructQueryItems(withKey: "id")
        let loginItems = login?.constructQueryItems(withKey: "login")
        var queryItems = [URLQueryItem]()
        
        if let ids = idItems, ids.count > 0 {
            queryItems.append(contentsOf: ids)
        }
        if let logins = loginItems, logins.count > 0 {
            queryItems.append(contentsOf: logins)
        }
        
        self.url = TwitchEndpoints.users.construct()?.appending(queryItems: queryItems)
    }
}
