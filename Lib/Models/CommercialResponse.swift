//
//  Commercial.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

public struct CommercialResponseWrapper: Codable {
    let commercial: [CommercialResponse]

    private enum CodingKeys: String, CodingKey {
        case commercial = "data"
    }
}

public struct CommercialResponse: Codable, Equatable {
    public let length: Int
    public let message: String
    public let retryAfter: Int
}
