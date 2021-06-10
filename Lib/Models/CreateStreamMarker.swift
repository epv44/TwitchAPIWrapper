//
//  CreateStreamMarker.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

/// Response from the server when issueing a create stream marker request see: https://dev.twitch.tv/docs/api/reference/#create-stream-marker
public struct CreateStreamMarkerResponse: Codable {
    public let data: [CreateStreamMarker]
}

/// Data object part of `CreateStreamMarkerResponse`see: https://dev.twitch.tv/docs/api/reference/#create-stream-marker
public struct CreateStreamMarker: Codable, Equatable {
    public let id: Int
    public let createdAt: Date
    public let description: String
    public let positionSeconds: Int
}
