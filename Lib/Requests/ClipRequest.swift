//
//  ClipRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

///Get clips request see https://dev.twitch.tv/docs/api/reference/#get-clips for details
public struct ClipRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(id: String?, gameID: String?, broadcasterID: String?) throws {
        if id == nil && gameID == nil && broadcasterID == nil {
            throw RequestValidationError.invalidInput(
                "id, gameID, and broadcasterID cannot all be null, at least one is required")
        }
        self.url = TwitchEndpoints.clips.construct()?.appending(
            queryItems: [
                "id": id,
                "game_id": gameID,
                "broadcaster_id": broadcasterID
            ].buildQueryItems())
    }
}

