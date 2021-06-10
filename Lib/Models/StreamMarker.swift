//
//  StreamMarker.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

/// Response object see: https://dev.twitch.tv/docs/api/reference/#get-stream-markers
public struct StreamMarkerResponse: Codable {
    public let streamMarkers: [StreamMarker]
    public let pagination: Paginate

    private enum CodingKeys: String, CodingKey {
        case streamMarkers = "data"
        case pagination
    }
}

/// Marker as part of the `StreamMarkerResponse` from the server: https://dev.twitch.tv/docs/api/reference/#get-stream-markers
public struct Marker: Codable, Equatable {
    public let id: String
    public let createdAt: Date
    public let description: String
    public let positionSeconds: Int
    public let url: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case description
        case positionSeconds
        case url = "URL"
    }
}

/// Video object as part of the `StreamMarkerResponse` from the server: https://dev.twitch.tv/docs/api/reference/#get-stream-markers
public struct StreamVideo: Codable, Equatable {
    public let videoId: String
    public let markers: [Marker]
}

/// StreamMarker as part of the`StreamMarkerResponse` from the server: https://dev.twitch.tv/docs/api/reference/#get-stream-markers
public struct StreamMarker: Codable, Equatable {
    public let userId: String
    public let userName: String
    public let userLogin: String
    public let videos: [StreamVideo]
}
