//
//  User.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

///Model representing a User from the Twitch API.
public struct User {
    public let type: String?
    public let name: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let links: [String]?
    public let logo: String?
    public let id: String?
    public let displayName: String?
    public let bio: String?
    //MARK: Below are ony available for https://api.twitch.tv/kraken/user with oauth token.
    public let email: String?
    public let partnered: String?
    public let notifications: [String: Bool]?
}

///User extension containing failable initializer.
public extension User {
    /**
     Create new `User` Model from a `JSONDictionaryType`.
     
     - parameter json: The `[String : Any]` dictionary returned from the network.
    */
    init?(json: JSONDictionaryType) {
        print(json)
        if let parsedType = json["type"] as? String {
            type = parsedType
        } else {
            type = nil
        }
        
        if let parsedName = json["name"] as? String {
           name = parsedName
        } else {
            name = nil
        }
        
        if let parsedCreatedAt = json["created_at"] as? String {
            createdAt = parsedCreatedAt
        } else {
            createdAt = nil
        }
        
        if let parsedUpdatedAt = json["updated_at"] as? String {
            updatedAt = parsedUpdatedAt
        } else {
            updatedAt = nil
        }
        
        if let parsedLinks = json["_links"] as? [String]? {
            links = parsedLinks
        } else {
            links = nil
        }
        
        if let parsedLogo = json["logo"] as? String {
            logo = parsedLogo
        } else {
            logo = nil
        }
        
        if let parsedId = json["_id"] as? String {
            id = parsedId
        } else {
            id = nil
        }
        
        if let parsedDisplayName = json["display_name"] as? String {
            displayName = parsedDisplayName
        } else {
            displayName = nil
        }
        
        if let parsedBio = json["bio"] as? String {
            bio = parsedBio
        } else {
            bio = nil
        }
        
        if let parsedEmail = json["email"] as? String {
            email = parsedEmail
        } else {
            email = nil
        }
        
        if let parsedPartnered = json["partnered"] as? String {
            partnered = parsedPartnered
        } else {
            partnered = nil
        }
        
        if let parsedNotifications = json["notifications"] as? [String: Bool] {
            notifications = parsedNotifications
        } else {
            notifications = nil
        }
    }
}
