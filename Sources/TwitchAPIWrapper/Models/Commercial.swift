//
//  Commercial.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

/// Response object for StartCommercial Request  see https://dev.twitch.tv/docs/api/reference/#start-commercial
public struct CommercialResponse: Codable {
    /// list of `Commercials`
    public let commercials: [Commercial]

    private enum CodingKeys: String, CodingKey {
        case commercials = "data"
    }
}

/// Inner commercial object represented by the StartCommercial API https://dev.twitch.tv/docs/api/reference/#start-commercial
public struct Commercial: Codable, Equatable {
    public let length: Int
    public let message: String
    public let retryAfter: Int
}
