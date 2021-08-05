//
//  CreateUserFollowRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

/// Create or delete user follow request, see https://dev.twitch.tv/docs/api/reference/#create-user-follows
/// and https://dev.twitch.tv/docs/api/reference/#delete-user-follows
public struct ModifyUserFollowRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod
    public let data: Data
    
    public init(httpMethod: HTTPMethod, fromID: String, toID: String, allowNotifications: Bool? = nil) throws {
        if ![.post, .delete].contains(httpMethod) {
            throw RequestValidationError.invalidInput("Ony post and delete are valid http methods")
        }
        var body = ["from_id": fromID, "to_id": toID]
        if let a = allowNotifications {
            body["allow_notifications"] = a ? "true" : "false"
        }
        if httpMethod == .delete {
            self.url = TwitchEndpoints.userFollows.construct()?.appending(queryItems: body.buildQueryItems())
            self.data = Data()
        } else {
            self.url = TwitchEndpoints.userFollows.construct()
            self.data = try JSONSerialization.data(withJSONObject: body, options: [])
        }
        self.method = httpMethod
    }
}
