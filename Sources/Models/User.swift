//
//  User.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

public struct User {
    let displayName: String?
    //let id: String?
    let name: String?
    //let type: String?
    //let bio: String?
    //let createdAt: String?
    //let updatedAt: String?
    //let logo: String?
    //let links: [String: String]?
}

public extension User {
    init?(json: JSONDictionaryType) {
        guard let parsedDisplayName = json["displayName"] as? String else {
            return nil
        }
        displayName = parsedDisplayName
        guard let parsedName = json["name"] as? String else {
           return nil
        }
        name = parsedName
    }
}
