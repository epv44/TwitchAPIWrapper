//
//  GetUserBlocklistResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetUserBlocklistResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(UserBlocklistResponse.self, from: Fixtures.dataFromFixtureFile("UserBlocklist"))
        XCTAssertEqual(wrapper.blocklist[0].userId, "135093069")
        XCTAssertEqual(wrapper.blocklist[0].userLogin, "bluelava")
        XCTAssertEqual(wrapper.blocklist[0].displayName, "BlueLava")
        
        XCTAssertEqual(wrapper.blocklist[1].userId, "27419011")
        XCTAssertEqual(wrapper.blocklist[1].userLogin, "travistyoj")
        XCTAssertEqual(wrapper.blocklist[1].displayName, "TravistyOJ")
    }
}
