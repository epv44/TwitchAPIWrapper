//
//  StreamMetadataModelTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import XCTest

@testable import TwitchAPIWrapper

class StreamMetadataModelTests: XCTestCase {
    func testBuildStreamMetadataModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let wrapper = try decoder.decode(StreamMetadataWrapper.self, from: Fixtures.dataFromFixtureFile("Game"))
            let streamMetadata1 = wrapper.streamsMetadata[0]
            let streamMetadata2 = wrapper.streamsMetadata[1]
            let streamMetadata3 = wrapper.streamsMetadata[2]
            let pagination = wrapper.pagination

            XCTAssertEqual(streamMetadata1.gameId, "488552")
            XCTAssertNil(streamMetadata1.hearthstone)
            XCTAssertEqual(streamMetadata1.overwatch?.broadcaster.ability, "Heavy Pulse Rifle")
            XCTAssertNil(streamMetadata1.overwatch?.broadcaster.class)
            XCTAssertEqual(streamMetadata1.overwatch?.broadcaster.name, "Soldier 76")
            XCTAssertEqual(streamMetadata1.overwatch?.broadcaster.role, "Offense")
            XCTAssertNil(streamMetadata1.overwatch?.broadcaster.type)
            XCTAssertNil(streamMetadata1.overwatch?.opponent)
            XCTAssertEqual(streamMetadata1.userId, "23161357")
            
            XCTAssertEqual(streamMetadata2.gameId, "138585")
            XCTAssertNil(streamMetadata2.hearthstone?.broadcaster.ability)
            XCTAssertEqual(streamMetadata2.hearthstone?.broadcaster.class, "Shaman")
            XCTAssertEqual(streamMetadata2.hearthstone?.broadcaster.name, "Thrall")
            XCTAssertNil(streamMetadata2.hearthstone?.broadcaster.role)
            XCTAssertEqual(streamMetadata2.hearthstone?.broadcaster.type, "Classic hero")
            XCTAssertNil(streamMetadata2.hearthstone?.opponent.ability)
            XCTAssertEqual(streamMetadata2.hearthstone?.opponent.class, "Warrior")
            XCTAssertEqual(streamMetadata2.hearthstone?.opponent.name, "Garrosh Hellscream")
            XCTAssertNil(streamMetadata2.hearthstone?.opponent.role)
            XCTAssertEqual(streamMetadata2.hearthstone?.opponent.type, "Classic hero")
            XCTAssertNil(streamMetadata2.overwatch)
            XCTAssertNil(streamMetadata2.overwatch?.broadcaster.class)
            XCTAssertEqual(streamMetadata2.userId, "1564968")
            
            XCTAssertEqual(streamMetadata3.userId, "5848726")
            XCTAssertNil(streamMetadata3.gameId)
            XCTAssertNil(streamMetadata3.hearthstone)
            XCTAssertNil(streamMetadata3.overwatch)
            
            XCTAssertEqual(pagination.cursor, "eyJiIjpudWxsLCJhIjp7Ik9mZnNldCI6MjB9fQ==")
        } catch {
            print(error)
        }
    }
}




