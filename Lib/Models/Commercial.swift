//
//  Commercial.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

public struct CommercialResponse: Codable {
    public let commercial: [Commercial]

    private enum CodingKeys: String, CodingKey {
        case commercial = "data"
    }
}

public struct Commercial: Codable, Equatable {
    public let length: Int
    public let message: String
    public let retryAfter: Int
}
