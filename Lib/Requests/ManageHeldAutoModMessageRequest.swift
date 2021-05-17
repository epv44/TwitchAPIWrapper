//
//  ManageHeldAutoModMessageRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

/// POST request to manage automod status, see https://dev.twitch.tv/docs/api/reference/#manage-held-automod-messages
public struct ManageHeldAutoModStatusRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    public let data: Data
    
    public init(userID: String, msgID: String, action: String) throws {
        self.url = TwitchEndpoints.checkAutoModStatus.construct()
        let body = [
                "msg_id": msgID,
                "action": action,
                "user_id": userID
            ]
        self.data = try JSONSerialization.data(
            withJSONObject: body,
            options: [])
    }
}


