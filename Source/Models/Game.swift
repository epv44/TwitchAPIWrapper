//
//  Game.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

class GameWrapper: Codable {
    let games: [Game]
    
    private enum CodingKeys: String, CodingKey {
        case games = "data"
    }
}

public class Game: Codable {
    public let id: String
    public let name: String
    public let boxArtURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case boxArtURL = "box_art_url"
    }
    
    init(id: String, name: String, boxArtURL: URL) {
        self.id = id
        self.name = name
        self.boxArtURL = boxArtURL
    }
}
