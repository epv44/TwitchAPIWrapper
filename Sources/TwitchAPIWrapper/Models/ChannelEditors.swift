//
//  ChannelEditors.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

/// Response object for channel editor request: https://dev.twitch.tv/docs/api/reference/#get-channel-editors
public struct ChannelEditorResponse: Codable {
    public let channelsEditors: [ChannelEditor]

    private enum CodingKeys: String, CodingKey {
        case channelsEditors = "data"
    }
}

/// Individual data pertaining to the  `ChannelEditorResponseObject` populated from https://dev.twitch.tv/docs/api/reference/#get-channel-editors
public struct ChannelEditor: Codable, Equatable {
    public let userId: String
    public let userName: String
    public let createdAt: Date
}
