//
//  UserFollowResource.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

public struct UserFollowRequest: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    
    init(after: String? = nil, first: String? = nil, fromId: String? = nil, toId: String? = nil) {
        let queryParams = ["after":after as Any, "first":first as Any, "from_id":fromId as Any, "to_id":toId as Any].buildQueryItems()
        self.url = TwitchEndpoints.userFollows.construct()?.appending(queryItems: queryParams)
        guard let clientID = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Client-ID": clientID]
    }
}
