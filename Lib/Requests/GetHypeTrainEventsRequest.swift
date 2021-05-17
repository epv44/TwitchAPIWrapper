//
//  GetHypeTrainEventsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///Get hype train event  request see https://dev.twitch.tv/docs/api/reference/#get-hype-train-events
public struct GetHypeTrainEventsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        broadcasterID: String,
        first: String? = nil,
        id: String? = nil,
        cursor: String? = nil
    ) {
        self.url = TwitchEndpoints.hypeTrainEvents.construct()?.appending(
            queryItems: [
                "broadcaster_id": broadcasterID,
                "first": first,
                "id": id,
                "cursor": cursor
            ].buildQueryItems())
    }
}
