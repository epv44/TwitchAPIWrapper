//
//  UserActiveExtensionResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/30/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UserActiveExtensionResponseTests: XCTestCase {
    
    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(UserActiveExtensionResponse.self, from: Fixtures.dataFromFixtureFile("UserActiveExtensions"))
        let data = wrapper.data
        XCTAssertEqual(data.panel["1"]?.active, true)
        XCTAssertEqual(data.panel["1"]?.id, "rh6jq1q334hqc2rr1qlzqbvwlfl3x0")
        XCTAssertEqual(data.panel["1"]?.version, "1.1.0")
        
        XCTAssertEqual(data.panel["2"]?.active, true)
        XCTAssertEqual(data.panel["2"]?.id, "wi08ebtatdc7oj83wtl9uxwz807l8b")
        XCTAssertEqual(data.panel["2"]?.version, "1.1.8")
        
        XCTAssertEqual(data.panel["3"]?.active, true)
        XCTAssertEqual(data.panel["3"]?.id, "naty2zwfp7vecaivuve8ef1hohh6bo")
        XCTAssertEqual(data.panel["3"]?.version, "1.0.9")
        
        XCTAssertEqual(data.overlay["1"]?.active, true)
        XCTAssertEqual(data.overlay["1"]?.id, "zfh2irvx2jb4s60f02jq0ajm8vwgka")
        XCTAssertEqual(data.overlay["1"]?.version, "1.0.19")
        XCTAssertEqual(data.overlay["1"]?.name, "Streamlabs")
        
        XCTAssertEqual(data.component["1"]?.active, true)
        XCTAssertEqual(data.component["1"]?.id, "lqnf3zxk0rv0g7gq92mtmnirjz2cjj")
        XCTAssertEqual(data.component["1"]?.version, "0.0.1")
        XCTAssertEqual(data.component["1"]?.name, "Dev Experience Test")
        XCTAssertEqual(data.component["1"]?.x, 0)
        XCTAssertEqual(data.component["1"]?.y, 0)
        
        XCTAssertEqual(data.component["2"]?.active, false)
    }
}
