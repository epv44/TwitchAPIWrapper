//
//  CodeStatusRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/8/21.
//

import Foundation

/// Code status request, see https://dev.twitch.tv/docs/api/reference/#get-code-status for details
public struct CodeStatusRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(codes: [String], userID: String) throws {
        var queryItems = codes.constructQueryItems(withKey: "code")
        queryItems.append(contentsOf: ["user_id": userID].buildQueryItems())
        self.url = TwitchEndpoints.codeStatus.construct()?.appending(
            queryItems: queryItems)
    }
}
