//
//  DeleteVideoRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/25/21.
//

import Foundation

///Delete video request see https://dev.twitch.tv/docs/api/reference/#delete-videos
public struct DeleteVideoRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .delete
    
    public init(ids: [String]) throws {
        if ids.count > 5 || ids.isEmpty {
            throw RequestValidationError.invalidInput("Must contain at least 1 id, with a limit of 5")
        }
        self.url = TwitchEndpoints.videos.construct()?.appending(queryItems: ids.constructQueryItems(withKey: "id"))
        
    }
}
