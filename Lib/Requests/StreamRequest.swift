//
//  StreamResource.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

public struct StreamRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        after: String? = nil,
        before: String? = nil,
        first: String? = nil,
        gameId: [String]? = nil,
        language: [String]? = nil,
        userId: [String]? = nil,
        userLogin: [String]? = nil
    ) {
        let queryParams = ["after": after as Any,
                           "before": before as Any,
                           "first": first as Any,
                           "game_id": gameId as Any,
                           "language": language as Any,
                           "user_id": userId as Any,
                           "user_login": userLogin as Any].buildQueryItems()
        
        self.url = TwitchEndpoints.streams.construct()?.appending(queryItems: queryParams)
    }
}
