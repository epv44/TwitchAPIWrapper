//
//  CheckAutoModStatusRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct AutoModStatusData {
    public let msgID: String
    public let msgText: String
    public let userID: String
}

/// POST request to check automod status, see https://dev.twitch.tv/docs/api/reference/#check-automod-status
public struct CheckAutoModStatusRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    public let data: Data
    
    public init(broadcasterID: String, data: [AutoModStatusData]) throws {
        self.url = TwitchEndpoints.checkAutoModStatus.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
        var body = [[String:String]]()
        for d in data {
            body.append([
                "msg_id": d.msgID,
                "msg_text": d.msgText,
                "user_id": d.userID
            ])
        }
        self.data = try JSONSerialization.data(
            withJSONObject: body,
            options: [])
    }
}
