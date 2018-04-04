//
//  UsersService.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

public struct UserResource: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    
    init(id: String, login: String) {
        self.url = TwitchEndpoints.users.construct()?.appending(queryItems: [URLQueryItem(name: "id", value: id), URLQueryItem(name: "login", value: login)])
        guard let clientId = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Authorization": clientId]
    }
}
