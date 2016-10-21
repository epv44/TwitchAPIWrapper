//
//  TwitchAPIEmoteResourceTests.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import XCTest
@testable import TwitchAPIWrapper

class TwitchAPIEmoteResourceTests: XCTestCase {
    func testBuildEmoteModelFromJSON() {
        let er = EmoteResource()
        let json: [String: Any] = ["emoticon_sets": ["0": [[ "id": 25, "code": "Kappa" ],[ "id": 1902, "code": "Keepo" ]],
                                                     "469":[[ "id": 2412, "code": "pipeKoppa"],["id": 33152, "code": "pipeKappa"]]
            ]]
        let emotes = er.model(from: json)
        XCTAssert(emotes?.count == 4)
        XCTAssertEqual(emotes?[0].id, 25)
        XCTAssertEqual(emotes?[0].code, "Kappa")
    }
    
    func testBuildEmoteModelFromJSONArray() {
        let er = EmoteResource()
        let json: [Any] = [[ "id": 25, "code": "Kappa" ],[ "id": 1902, "code": "Keepo" ]]
        let emotes = er.model(from: json)
        XCTAssert(emotes?.count == 2)
        XCTAssertEqual(emotes?[0].id, 25)
        XCTAssertEqual(emotes?[1].id, 1902)
    }
}
