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
    
    public init(id: String? = nil) {
        self.url = TwitchEndpoints.clips.construct()?.appending(queryItems: ["id": id].buildQueryItems())
        guard let clientID = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Client-ID": clientID]
    }
}

