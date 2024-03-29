//
//  VideoRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

///Get videos request see https://dev.twitch.tv/docs/api/reference/#get-videos for details
public struct VideoRequest: JSONConstructableRequest {
    ///URL for the request
    public let url: URL?
    
    ///Initialize a `VideoRequest` with the included parameters
    /// - throws `RequestValidationError`.
    public init(
        id: [String]?,
        userID: String?,
        gameID: String?,
        after: String? = nil,
        before: String? = nil,
        first: String? = nil,
        language: [String]? = nil,
        period: String? = nil,
        sort: String? = nil,
        type: String? = nil
    ) throws {
        if id == nil && userID == nil && gameID == nil {
            throw RequestValidationError.invalidInput(
                "id, gameID, and userID cannot all be null, at least one is required")
        }
        let queryParams = ["id":id as Any,
                           "user_id":userID as Any,
                           "game_id":gameID as Any,
                           "after":after as Any,
                           "before":before as Any,
                           "first":first as Any,
                           "language":language as Any,
                           "period":period as Any,
                           "sort":sort as Any,
                           "type":type as Any].buildQueryItems()
        self.url = TwitchEndpoints.videos.construct()?.appending(queryItems: queryParams)
    }
}
