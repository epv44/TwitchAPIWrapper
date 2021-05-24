//
//  UserActiveExtension.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

public struct UserActiveExtensionResponse: Codable {
    public let data: ExtensionData
}

public struct ActiveExtensions: Codable, Equatable {
    public let active: Bool
    public let id: String?
    public let version: String?
    public let name: String?
    public let x: String?
    public let y: String?
}

public struct ExtensionData: Codable, Equatable {
    public let panel: [String:ActiveExtensions]
    public let overlay: [String:ActiveExtensions]
    public let component: [String:ActiveExtensions]
}
