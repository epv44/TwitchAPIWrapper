//
//  DeleteVideoResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/28/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class DeleteVideoResponseTests: XCTestCase {

    func testBuildModel() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(DeleteVideoResponse.self, from: Fixtures.dataFromFixtureFile("DeleteVideo"))
        XCTAssertEqual(wrapper.data, ["1234", "9876"])
    }
}
