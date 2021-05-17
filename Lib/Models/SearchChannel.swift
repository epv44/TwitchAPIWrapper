//
//  SearchChannel.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct SearchChannelResponse: Codable {
    public let searchChannels: [SearchChannel]
    public let pagination: Paginate?

    private enum CodingKeys: String, CodingKey {
        case searchChannels = "data"
        case pagination
    }
}

public struct SearchChannel: Codable, Equatable {
    public let broadcasterLanguage: String
    public let broadcasterLogin: String
    public let displayName: String
    public let gameId: String
    public let id: String
    public let isLive: Bool
    public let tagIds: [String]
    public let thumbnailUrl: URL
    public let title: String
    public let startedAt: Date
}
