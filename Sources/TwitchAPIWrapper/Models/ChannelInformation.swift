//
//  ChannelInformation.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

/// Response object containing data from the channel information request: https://dev.twitch.tv/docs/api/reference/#get-channel-information
public struct ChannelInformationResponse: Codable {
    public let channels: [ChannelInformation]

    private enum CodingKeys: String, CodingKey {
        case channels = "data"
    }
}

/// Object representing channel information from the server: https://dev.twitch.tv/docs/api/reference/#get-channel-information
public struct ChannelInformation: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterName: String
    public let broadcasterLanguage: String
    public let broadcasterLogin: String
    public let gameId: String
    public let gameName: String
    public let title: String
    public let delay: Int
}
