//
//  ModifyChannelInformation.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

/// PATCH request to modify channel information, see https://dev.twitch.tv/docs/api/reference/#modify-channel-information for details
public struct ModifyChannelInformationRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .patch
    public let data: Data
    
    public init(
        broadcasterID: String,
        gameID: String,
        broadcasterLanguage: String,
        title: String,
        delay: Int?
    ) throws {
        var body = [
            "game_id": gameID,
            "broadcaster_language": broadcasterLanguage,
            "title": title]
        if let d = delay {
            body["delay"] = String(d)
        }
        self.data = try JSONSerialization.data(
            withJSONObject: body,
            options: [])
        self.url = TwitchEndpoints.channelInformation.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
    }
}
