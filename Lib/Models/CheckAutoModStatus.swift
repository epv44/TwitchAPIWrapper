//
//  CheckAutoModStatus.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct CheckAutoModStatusResponse: Codable {
    public let data: [CheckAutoModeStatus]
}

public struct CheckAutoModeStatus: Codable, Equatable {
    public let msgId: String
    public let isPermitted: Bool
}
