//
//  EntitlementResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class EntitlementResponseTests: XCTestCase {
    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()

        let wrapper = try decoder.decode(EntitlementResponse.self, from: Fixtures.dataFromFixtureFile("Entitlement"))
        XCTAssertEqual(wrapper.pagination?.cursor, "eyJiIjpudW")
        XCTAssertEqual(wrapper.entitlements[0].id, "fb78259e-fb81-4d1b-8333-34a06ffc24c0")
        XCTAssertEqual(wrapper.entitlements[0].benefitId, "74c52265-e214-48a6-91b9-23b6014e8041")
        XCTAssertEqual(wrapper.entitlements[0].timestamp, ISO8601DateFormatter().date(from: "2018-06-01T00:00:00Z"))
        XCTAssertEqual(wrapper.entitlements[0].userId, "25009227")
        XCTAssertEqual(wrapper.entitlements[0].gameId, "33214")
        XCTAssertEqual(wrapper.entitlements[0].fulfillmentStatus, EntitlementFulfillmentStatus.claimed)
        XCTAssertEqual(wrapper.entitlements[0].updatedAt, ISO8601DateFormatter().date(from: "2018-06-01T00:00:00Z"))
    }
}

