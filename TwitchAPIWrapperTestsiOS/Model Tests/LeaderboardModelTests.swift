//
//  LeaderboardTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import XCTest

@testable import TwitchAPIWrapper

class LeaderboardModelTests: XCTestCase {
    func testBuildLeaderboardModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let leaderboard = try decoder.decode(Leaderboard.self, from: Fixtures.dataFromFixtureFile("Leaderboard"))
            let leader = leaderboard.entries[0]
            XCTAssertEqual(leaderboard.entries.count, 2)
            XCTAssertEqual(leaderboard.total, 2)
            XCTAssertEqual(leader.rank, 1)
            XCTAssertEqual(leader.score, 12543)
            XCTAssertEqual(leader.userId, "158010205")
        } catch {
            print(error)
        }
    }
}

