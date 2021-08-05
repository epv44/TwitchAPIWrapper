//
//  UserFollowResource.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

///Get user follows request see https://dev.twitch.tv/docs/api/reference/#update-user for details
public struct UserFollowRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        after: String? = nil,
        first: String? = nil,
        fromID: String? = nil,
        toID: String? = nil
    ) throws {
        if fromID == nil && toID == nil {
            throw RequestValidationError.invalidInput(
                "At minimum, from_id or to_id must be provided for a query to be valid")
        }
        let queryParams = [
            "after": after,
            "first": first,
            "from_id": fromID,
            "to_id": toID].buildQueryItems()
        self.url = TwitchEndpoints.userFollows.construct()?.appending(queryItems: queryParams)
    }
}
