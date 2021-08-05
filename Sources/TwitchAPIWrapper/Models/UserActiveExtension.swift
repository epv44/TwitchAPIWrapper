//
//  UserActiveExtension.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

/// Response object for User Active Extensions see https://dev.twitch.tv/docs/api/reference/#update-user-extensions
public struct UserActiveExtensionResponse: Codable {
    public let data: ExtensionData
}

/// An "Extension" This reusable object represents the different extensions
public struct ActiveExtensions: Codable, Equatable {
    public let active: Bool
    public let id: String?
    public let version: String?
    public let name: String?
    public let x: Int?
    public let y: Int?
}

/// Struct containing data from API request, each section is formatted as [String:ActiveExtension] as the
/// string key comes from the server
public struct ExtensionData: Codable, Equatable {
    public let panel: [String:ActiveExtensions]
    public let overlay: [String:ActiveExtensions]
    public let component: [String:ActiveExtensions]
}
