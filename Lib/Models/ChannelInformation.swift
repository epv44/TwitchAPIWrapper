//
//  ChannelInformation.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

public struct ChannelInformationResponse: Codable {
    public let channels: [ChannelInformation]

    private enum CodingKeys: String, CodingKey {
        case channels = "data"
    }
}

public struct ChannelInformation: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterName: String
    public let broadcasterLanguage: String
    public let gameId: String
    public let gameName: String
    public let title: String
}
