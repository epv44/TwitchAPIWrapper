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
    ///The users type
    public let type: String?
    
    ///The name of the user
    public let name: String?
    
    ///When the user account was created
    public let createdAt: String?
    
    ///When the user account was last updated
    public let updatedAt: String?
    
    ///Links associated with the user's account
    public let links: [String:String]?
    
    ///The users Twitch account associated image
    public let logo: String?
    
    ///The user's unique id
    public let id: Int?
    
    ///The users Twitch display name
    public let displayName: String?
    
    ///The users Twitch bio
    public let bio: String?
    
    //MARK: Ony available for https://api.twitch.tv/kraken/user (requires authorization).
    ///The users email, requires Authentication
    public let email: String?
    
    ///The users partnership status, requires Authentication
    public let partnered: Bool?
    
    ///The users notification settings, requires Authentication
    public let notifications: [String: Bool]?
}

///User extension containing failable initializer.
public extension User {
    /**
     Create new `User` Model from a `JSONDictionaryType`.
     
     - parameter json: The `[String : Any]` dictionary returned from the network.
    */
    init?(json: JSONDictionaryType) {
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
        
        if let parsedLinks = json["_links"] as? [String:String]? {
            links = parsedLinks
        } else {
            links = nil
        }
        
        if let parsedLogo = json["logo"] as? String {
            logo = parsedLogo
        } else {
            logo = nil
        }
        
        if let parsedId = json["_id"] as? Int {
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
        
        if let parsedPartnered = json["partnered"] as? Bool {
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
