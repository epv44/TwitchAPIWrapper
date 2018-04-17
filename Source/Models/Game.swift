//
//  Game.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

struct GameWrapper: Codable {
    let games: [Game]
    
    private enum CodingKeys: String, CodingKey {
        case games = "data"
    }
}

public struct Game: Codable, Equatable {
    public let id: String
    public let name: String
    public let boxArtURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case boxArtURL = "box_art_url"
    }
}
