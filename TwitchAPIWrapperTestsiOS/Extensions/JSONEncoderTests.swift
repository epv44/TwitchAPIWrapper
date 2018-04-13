//
//  JSONEncoderTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/11/18.
//

import XCTest
@testable import TwitchAPIWrapper

class JSONEncoderTests: XCTestCase {
    func testJSONEncoder() {
        let testModel = Fixtures.game()
        let encoder = JSONEncoder.twitchAPIStandard()
        let data = try! encoder.encode(testModel)
        let decoded = try! JSONDecoder().decode(Game.self, from: data)
        XCTAssertEqual(testModel, decoded)
    }
}
