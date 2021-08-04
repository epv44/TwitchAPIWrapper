//
//  CodeStatusResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CodeStatusResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(CodeStatusResponse.self, from: Fixtures.dataFromFixtureFile("CodeStatus"))
        XCTAssertEqual(wrapper.codeStatuses[0].code, "KUHXV-4GXYP-AKAKK")
        XCTAssertEqual(wrapper.codeStatuses[0].status, CodeSuccessStatus.unused)
    }
}
