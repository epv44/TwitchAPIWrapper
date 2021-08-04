//
//  UpdateEntitlementsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UpdateEntitlementsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(UpdateEntitlementResponse.self, from: Fixtures.dataFromFixtureFile("UpdateBlocksEntitlement"))
        XCTAssertEqual(wrapper.data[0].status, UpdatedEntitlementStatus.success)
        XCTAssertEqual(
            wrapper.data[0].ids,
            [
                "fb78259e-fb81-4d1b-8333-34a06ffc24c0",
                "862750a5-265e-4ab6-9f0a-c64df3d54dd0"
            ]
        )
    }
}
