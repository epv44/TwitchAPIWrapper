//
//  ClipRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

public struct ClipRequest: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    
    init(id: String? = nil) {
        if let id = id {
            self.url = TwitchEndpoints.clips.construct()?.appending(queryItems: [URLQueryItem(name: "id", value: id)])
        } else {
            self.url = TwitchEndpoints.clips.construct()
        }
        
        guard let clientId = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Client-ID": clientId]
    }
}
