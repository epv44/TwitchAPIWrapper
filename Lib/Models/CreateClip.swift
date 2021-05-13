//
//  CreateClip.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct CreateClipResponse: Codable {
    public let clips: [CreateClip]

    private enum CodingKeys: String, CodingKey {
        case clips = "data"
    }
}

public struct CreateClip: Codable, Equatable {
    public let id: String
    public let editUrl: URL
}
