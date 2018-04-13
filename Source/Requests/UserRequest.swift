//
//  UserRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

public struct UserRequest: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    
    init(id: [String]? = nil, login: [String]? = nil) {
        self.url = TwitchEndpoints.users.construct()?.appending(queryItems: ["id":id as Any, "login":login as Any].buildQueryItems())
        guard let authToken = TwitchAuthorizationManager.sharedInstance.authToken else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Authorization": authToken]
    }
}
