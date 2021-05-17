//
//  CreateStreamMarker.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct CreateStreamMarkerResponse: Codable {
    public let data: [CreateStreamMarker]
}

public struct CreateStreamMarker: Codable, Equatable {
    public let id: String
    public let createdAt: Date
    public let description: String
    public let positionSeconds: Int
}
