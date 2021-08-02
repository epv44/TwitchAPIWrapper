//
//  CheermoteResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CheermoteResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(CheermoteResponse.self, from: Fixtures.dataFromFixtureFile("Cheermotes"))
        XCTAssertEqual(wrapper.responses[0].prefix, "Cheer")
        XCTAssertEqual(wrapper.responses[0].type, CheermoteType.globalFirstParty)
        XCTAssertEqual(wrapper.responses[0].order, 1)
        XCTAssertEqual(wrapper.responses[0].lastUpdated, ISO8601DateFormatter().date(from: "2018-05-22T00:06:04Z"))
        XCTAssertEqual(wrapper.responses[0].isCharitable, false)
        XCTAssertEqual(wrapper.responses[0].tiers[0].minBits, 1)
        XCTAssertEqual(wrapper.responses[0].tiers[0].id, "1")
        XCTAssertEqual(wrapper.responses[0].tiers[0].color, "#979797")
        XCTAssertEqual(wrapper.responses[0].tiers[0].canCheer, true)
        XCTAssertEqual(wrapper.responses[0].tiers[0].showInBitsCard, true)
        XCTAssertEqual(wrapper.responses[0].tiers[0].images["dark"]?["animated"],
                       [
                        "1": URL(string:"https://d3aqoihi2n8ty8.cloudfront.net/actions/cheer/dark/animated/1/1.gif")!,
                        "1.5": URL(string:"https://d3aqoihi2n8ty8.cloudfront.net/actions/cheer/dark/animated/1/1.5.gif")!,
                        "2": URL(string:"https://d3aqoihi2n8ty8.cloudfront.net/actions/cheer/dark/animated/1/2.gif")!,
                        "3": URL(string:"https://d3aqoihi2n8ty8.cloudfront.net/actions/cheer/dark/animated/1/3.gif")!,
                        "4": URL(string:"https://d3aqoihi2n8ty8.cloudfront.net/actions/cheer/dark/animated/1/4.gif")!
                       ])
        
    }
}
