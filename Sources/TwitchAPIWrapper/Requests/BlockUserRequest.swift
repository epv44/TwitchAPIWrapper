//
//  BlockUserRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

///Block user request https://dev.twitch.tv/docs/api/reference/#block-user
public struct BlockUserRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .put
    
    public init(
        targetUserID: String,
        sourceContext: String? = nil,
        reason: String? = nil
    ) {
        self.url = TwitchEndpoints.userBlocks.construct()?.appending(
            queryItems: [
                "target_user_id": targetUserID,
                "source_context": sourceContext,
                "reason": reason].buildQueryItems())
    }
}
