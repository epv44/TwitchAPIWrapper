//
//  VideoRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

public struct VideoRequest: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    
    init(id: [String],
         userId: String,
         gameId: String,
         after: String? = nil,
         before: String? = nil,
         first: String? = nil,
         language: [String]? = nil,
         period: String? = nil,
         sort: String? = nil,
         type: String? = nil) {
        let queryParams = ["id":id as Any,
                           "user_id":userId as Any,
                           "game_id":gameId as Any,
                           "after":after as Any,
                           "before":before as Any,
                           "first":first as Any,
                           "language":language as Any,
                           "period":period as Any,
                           "sort":sort as Any,
                           "type":type as Any].buildQueryItems()
        self.url = TwitchEndpoints.videos.construct()?.appending(queryItems: queryParams)
        guard let clientID = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Client-ID": clientID]
    }
}
