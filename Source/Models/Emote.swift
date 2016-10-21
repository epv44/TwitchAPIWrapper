//
//  Emote.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import Foundation
import Gloss

///Model representing an Emoticon
public struct Emote: Decodable {
    ///The Emoticon's ID
    let id: Int?
    
    ///The Emoticon's String code
    let code: String?
}

//MARK: - Initializers Extension
///Extension for initializers
public extension Emote {
    /**
     Constructs a new Emote.
     
     - parameter json: The `[String : Any]` dictionary returned from the network.
     
     - returns: A new `Emote` instance.
     */
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.code = "code" <~~ json
    }
}
