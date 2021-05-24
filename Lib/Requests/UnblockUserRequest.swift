//
//  UnblockUserRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

///Block user request https://dev.twitch.tv/docs/api/reference/#block-user
public struct UnblockUserRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .delete
    
    public init(targetUserID: String) {
        self.url = TwitchEndpoints.userBlocks.construct()?.appending(
            queryItems: ["target_user_id": targetUserID].buildQueryItems())
    }
}
