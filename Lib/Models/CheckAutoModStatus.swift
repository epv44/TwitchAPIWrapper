//
//  CheckAutoModStatus.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///AutoMod Status response object: https://dev.twitch.tv/docs/api/reference/#check-automod-status
public struct CheckAutoModStatusResponse: Codable {
    public let data: [CheckAutoModeStatus]
}

/// Part of the `AutoModStatusResponse` from https://dev.twitch.tv/docs/api/reference/#check-automod-status
public struct CheckAutoModeStatus: Codable, Equatable {
    public let msgId: String
    public let isPermitted: Bool
}
