//
//  StreamMarker.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct StreamMarkerResponse: Codable {
    public let streamMarkers: [StreamMarker]
    public let pagination: Paginate

    private enum CodingKeys: String, CodingKey {
        case streamMarkers = "data"
        case pagination
    }
}

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

public struct StreamVideo: Codable, Equatable {
    public let videoId: String
    public let markers: [Marker]
}

public struct StreamMarker: Codable, Equatable {
    public let userId: String
    public let userName: String
    public let userLogin: String
    public let videos: [StreamVideo]
}
