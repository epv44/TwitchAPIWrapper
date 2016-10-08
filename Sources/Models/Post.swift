//
//  Post.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

struct Post {
    var id: String?
    var createdAt: String?
    var deleted: String?
    var emotes: [String]?
    var reactions: [Endorsement]?
    var body: String?
    var user: User?
    
}
