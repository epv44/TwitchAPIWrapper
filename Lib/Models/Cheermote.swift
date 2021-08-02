//
//  Cheermote.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

/// Response object of available cheermotes: https://dev.twitch.tv/docs/api/reference/#get-cheermotes
public struct CheermoteResponse: Codable {
    public let responses: [CheermoteResponseData]
    
    private enum CodingKeys: String, CodingKey {
        case responses = "data"
    }
}

/// Represents a cheermote type, matches server: https://dev.twitch.tv/docs/api/reference/#get-cheermotes
public enum CheermoteType: String, Codable {
    case globalFirstParty = "global_first_party"
    case globalThirdParty = "global_third_party"
    case channelCustom = "channel_custom"
    case displayOnly = "display_only"
    case sponsored = "sponsored"
}

/// Individual cheermote object from: https://dev.twitch.tv/docs/api/reference/#get-cheermotes
public struct Cheermote: Codable, Equatable {
    public let minBits: Int
    public let id: String
    public let color: String
    public let images: [String:[String:[String:URL]]]
    public let canCheer: Bool
    public let showInBitsCard: Bool
}

/// Individual cheermote data object, contains the cheermote and associated data: https://dev.twitch.tv/docs/api/reference/#get-cheermotes
public struct CheermoteResponseData: Codable, Equatable {
    public let prefix: String
    public let tiers: [Cheermote]
    public let type: CheermoteType
    public let order: Int
    public let lastUpdated: Date
    public let isCharitable: Bool
}
