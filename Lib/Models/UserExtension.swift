//
//  UserExtension.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

///Response object for UserExtensions see: https://dev.twitch.tv/docs/api/reference/#get-user-extensions
public struct UserExtensionResponse: Codable {
    public let extensions: [Extension]

    private enum CodingKeys: String, CodingKey {
        case extensions = "data"
    }
}

///Valid options for the user extension type see: https://dev.twitch.tv/docs/api/reference/#get-user-extensions
public enum ExtensionType: String, Codable {
    case component
    case mobile
    case panel
    case overlay
}

///Extension object that is part of the extension response see: https://dev.twitch.tv/docs/api/reference/#get-user-extensions
public struct Extension: Codable, Equatable {
    public let id: String
    public let version: String
    public let name: String
    public let canActivate: Bool
    public let type: [ExtensionType]
}
