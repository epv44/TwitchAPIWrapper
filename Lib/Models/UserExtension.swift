//
//  UserExtension.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

public struct UserExtensionResponse: Codable {
    public let extensions: [Extension]

    private enum CodingKeys: String, CodingKey {
        case extensions = "data"
    }
}

public enum ExtensionType: String, Codable {
    case component
    case mobile
    case panel
    case overlay
}

public struct Extension: Codable, Equatable {
    public let id: String
    public let version: String
    public let name: String
    public let canActivate: Bool
    public let type: [ExtensionType]
}
