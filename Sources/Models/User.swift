//
//  User.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

public struct User {
    let type: String?
    let name: String?
    let createdAt: String?
    let updatedAt: String?
    let links: String?
    let logo: String?
    let id: String?
    let displayName: String?
    let bio: String?
    
    
}

public extension User {
    init?(json: JSONDictionaryType) {
        guard let parsedType = json["type"] as? String else {
            return nil
        }
        type = parsedType
        guard let parsedName = json["name"] as? String else {
           return nil
        }
        name = parsedName
        guard let parsedCreatedAt = json["created_at"] as? String else {
            return nil
        }
        createdAt = parsedCreatedAt
        guard let parsedUpdatedAt = json["updated_at"] as? String else {
            return nil
        }
        updatedAt = parsedUpdatedAt
        guard let parsedLinks = json["_links"] as? String? else {
            return nil
        }
        links = parsedLinks
        guard let parsedLogo = json["logo"] as? String else {
            return nil
        }
        logo = parsedLogo
        guard let parsedId = json["_id"] as? String else {
            return nil
        }
        id = parsedId
        guard let parsedDisplayName = json["display_name"] as? String else {
            return nil
        }
        displayName = parsedDisplayName
        guard let parsedBio = json["bio"] as? String else {
            return nil
        }
        bio = parsedBio
    }
}
