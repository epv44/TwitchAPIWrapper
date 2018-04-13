//
//  GameModelTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import XCTest

@testable import TwitchAPIWrapper

class GameModelTests: XCTestCase {
    func testBuildGameModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let wrapper = try decoder.decode(GameWrapper.self, from: Fixtures.dataFromFixtureFile("Game"))
            let game = wrapper.games[0]
            XCTAssertEqual(game.id, "493057")
            XCTAssertEqual(game.name, "PLAYERUNKNOWN'S BATTLEGROUNDS")
            XCTAssertEqual(game.boxArtURL.absoluteString, URL(string: "https://static-cdn.jtvnw.net/ttv-boxart/PLAYERUNKNOWN%27S%20BATTLEGROUNDS-{width}x{height}.jpg")?.absoluteString)
        } catch {
            print(error)
        }
    }
}


