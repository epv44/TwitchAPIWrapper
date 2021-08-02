//
//  ExtensionAnalyticsResponseTest.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ExtensionAnalyticsResponseTest: XCTestCase {
    
    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(ExtensionAnalyticsResponse.self, from: Fixtures.dataFromFixtureFile("ExtensionAnalytics"))
        XCTAssertEqual(wrapper.pagination.cursor, "eyJiIjpudWxsLCJhIjp7Ik9mZnNldCI6NX19")
        XCTAssertEqual(wrapper.extensionAnalytics[0].dateRange.startedAt, ISO8601DateFormatter().date(from: "2018-03-01T00:00:00Z"))
        XCTAssertEqual(wrapper.extensionAnalytics[0].dateRange.endedAt, ISO8601DateFormatter().date(from: "2018-06-01T00:00:00Z"))
        XCTAssertEqual(wrapper.extensionAnalytics[0].extensionId, "efgh")
        XCTAssertEqual(wrapper.extensionAnalytics[0].type, "overview_v2")
        XCTAssertEqual(wrapper.extensionAnalytics[0].url, URL(string: "https://twitch-piper-reports.s3-us-west-2.amazonaws.com/dynamic"))
    }
}
