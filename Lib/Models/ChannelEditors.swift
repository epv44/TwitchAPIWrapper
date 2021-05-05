//
//  ChannelEditors.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

public struct ChannelEditorResponse: Codable {
    public let channelsEditors: [ChannelEditor]

    private enum CodingKeys: String, CodingKey {
        case channelsEditors = "data"
    }
}

public struct ChannelEditor: Codable, Equatable {
    public let userId: String
    public let userName: String
    public let createdAt: Date
}
