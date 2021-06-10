//
//  GetStreamMarkersRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///Get stream markers  request see https://dev.twitch.tv/docs/api/reference/#get-stream-markers
public struct GetStreamMarkersRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        userID: String? = nil,
        videoID: String? = nil,
        after: String? = nil,
        before: String? = nil,
        first: String? = nil
    ) throws {
        if userID == nil && videoID == nil {
            throw RequestValidationError.invalidInput("User id and video id cannot both be nil")
        }
        self.url = TwitchEndpoints.streamMarkers.construct()?.appending(
            queryItems: [
                "user_id": userID,
                "video_id": videoID,
                "after": after,
                "before": before,
                "first": first].buildQueryItems())
    }
}
