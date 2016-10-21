//
//  Post.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

///Model representing a post from the Twitch API.
public struct Post {
    var id: Int?
    var createdAt: String?
    var deleted: String?
    var emotes: [String]?
    var reactions: [Endorsement]?
    var body: String?
    var user: User?
    
}
