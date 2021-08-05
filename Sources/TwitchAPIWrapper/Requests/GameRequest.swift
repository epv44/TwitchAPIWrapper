//
//  GameRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

///Get games request see https://dev.twitch.tv/docs/api/reference/#get-games for details
public struct GameRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(id: [String]?, name: [String]?) throws {
        if id == nil && name == nil {
            throw RequestValidationError.invalidInput("id and name are both null at least one is required")
        }
        self.url = TwitchEndpoints.games.construct()?.appending(queryItems: ["id": id, "name": name].buildQueryItems())
    }
}

