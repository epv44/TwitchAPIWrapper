//
//  UserUpdateRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/11/18.
//

import Foundation

public struct UserUpdateRequest: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    let method: HTTPMethod = .put
    
    init(description: String) {
        self.url = TwitchEndpoints.users.construct()?.appending(queryItems: ["description":description].buildQueryItems())
        guard let authToken = TwitchAuthorizationManager.sharedInstance.authToken else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Authorization": authToken]
    }
}

