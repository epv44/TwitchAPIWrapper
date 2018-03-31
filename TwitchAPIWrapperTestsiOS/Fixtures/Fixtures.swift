//
//  Fixtures.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation
@testable import TwitchAPIWrapper

enum FixtureError: Error {
    case resourceNotFound
    case unparseableJSON
}

class Fixtures {
    
    class func leaderboard() -> Leaderboard {
        let entry1 = LeaderboardEntry(userId: "158010205", rank: 1, score: 12543)
        let entry2 = LeaderboardEntry(userId: "7168163", rank: 2, score: 6900)
        let date = Date.twitchStandardDateFormatter.date(from: "2018-02-05T08:00:00Z")!
        let leaderboard = Leaderboard(entries: [entry1, entry2], dateRange: DateRange(startedAt: date, endedAt: date) , total: 2)
        return leaderboard
    }
    
    class func clip() -> Clip {
        let date = Date.twitchStandardDateFormatter.date(from: "2017-11-30T22:34:18Z")!
        let clip = Clip(id: "AwkwardHelplessSalamanderSwiftRage", url: URL(string: "https://clips.twitch.tv/AwkwardHelplessSalamanderSwiftRage")!, embedURL: URL(string: "https://clips.twitch.tv/embed?clip=AwkwardHelplessSalamanderSwiftRage")!, broadcasterId: "67955580", creatorId: "53834192", videoId: "205586603", gameId: "488191", language: "en", title: "babymetal", viewCount: 10, createdAt: date, thumbnailURL: URL(string: "https://clips-media-assets.twitch.tv/157589949-preview-480x272.jpg")!)
        return clip
    }
    
    class func game() -> Game {
        let game = Game(id: "493057", name: "PLAYERUNKNOWN'S BATTLEGROUNDS", boxArtURL: URL(string: "https://static-cdn.jtvnw.net/ttv-boxart/PLAYERUNKNOWN%27S%20BATTLEGROUNDS-{width}x{height}.jpg")!)
        return game
    }
    
    class func dataFromFixtureFile(_ basename: String) throws -> Data {
        let ext = "json"
        guard let url = Bundle(for: self).url(forResource: basename, withExtension: ext) else {
            throw FixtureError.resourceNotFound
        }
        return try Data(contentsOf: url)
    }
    
    class func jsonFromFixtureFile(_ basename: String) throws -> [String:Any] {
        let data = try dataFromFixtureFile(basename)
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {
            throw FixtureError.unparseableJSON
        }
        return json
    }
}
