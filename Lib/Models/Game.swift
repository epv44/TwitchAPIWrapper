//
//  Game.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct GameResponse: Codable {
    public let games: [Game]
    public let pagination: Paginate?
    
    private enum CodingKeys: String, CodingKey {
        case games = "data"
        case pagination
    }
}

public struct Game: Codable, Equatable {
    public let id: String
    public let name: String
    //Leaving as an optional string due to serialization issues with the twitch url
    public let boxArtUrl: String?
}
