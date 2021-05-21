//
//  StreamTag.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

public struct StreamTagResponse: Codable {
    public let streamTags: [StreamTag]
    public let pagination: Paginate?

    private enum CodingKeys: String, CodingKey {
        case streamTags = "data"
        case pagination
    }
}

public struct StreamTag: Codable, Equatable {
    public let tagId: String
    public let isAuto: Bool
    public let localizationNames: [String:String]
    public let localizationDescriptions: [String:String]
}
