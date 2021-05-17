//
//  StreamKey.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct StreamKeyResponse: Codable {
    public let keys: [StreamKey]

    private enum CodingKeys: String, CodingKey {
        case keys = "data"
    }
}

public struct StreamKey: Codable, Equatable {
    public let streamKey: String
}
