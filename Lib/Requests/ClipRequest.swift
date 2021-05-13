//
//  ClipRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

///Get clips request see https://dev.twitch.tv/docs/api/reference/#get-clips
///Create clips request see https://dev.twitch.tv/docs/api/reference/#create-clip
public struct ClipRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod
    
    public init(
        httpMethod: HTTPMethod,
        id: String?,
        gameID: String?,
        broadcasterID: String?,
        hasDelay: String? = nil
    ) throws {
        if id == nil && gameID == nil && broadcasterID == nil {
            throw RequestValidationError.invalidInput(
                "id, gameID, and broadcasterID cannot all be null, at least one is required")
        }
        if httpMethod == .post && broadcasterID == nil {
            throw RequestValidationError.invalidInput("For a post request you must have a broadcasterID")
        }
        self.method = httpMethod
        self.url = TwitchEndpoints.clips.construct()?.appending(
            queryItems: [
                "id": id,
                "game_id": gameID,
                "broadcaster_id": broadcasterID,
                "has_delay": hasDelay
            ].buildQueryItems())
    }
}

