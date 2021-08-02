//
//  ExtensionTransactionResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ExtensionTransactionResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(ExtensionTransactionsResponse.self, from: Fixtures.dataFromFixtureFile("ExtensionTransaction"))
        XCTAssertEqual(wrapper.pagination.cursor, "cursorString")
        XCTAssertEqual(wrapper.extensionTransactions[0].id, "74c52265-e214-48a6-91b9-23b6014e8041")
        XCTAssertEqual(
            wrapper.extensionTransactions[0].timestamp, ISO8601DateFormatter().date(from: "2018-02-05T08:00:00Z"))
        XCTAssertEqual(wrapper.extensionTransactions[0].broadcasterId, "439964613")
        XCTAssertEqual(wrapper.extensionTransactions[0].broadcasterLogin, "chikuseuma")
        XCTAssertEqual(wrapper.extensionTransactions[0].broadcasterName, "chikuseuma")
        XCTAssertEqual(wrapper.extensionTransactions[0].userId, "424596340")
        XCTAssertEqual(wrapper.extensionTransactions[0].userName, "quotrok")
        XCTAssertEqual(wrapper.extensionTransactions[0].userLogin, "quotrok")
        XCTAssertEqual(wrapper.extensionTransactions[0].productType, "BITS_IN_EXTENSION")
        XCTAssertEqual(
            wrapper.extensionTransactions[0].productData.domain, "twitch.ext.uo6dggojyb8d6soh92zknwmi5ej1q2")
        XCTAssertEqual(wrapper.extensionTransactions[0].productData.sku, "testSku100")
        XCTAssertEqual(wrapper.extensionTransactions[0].productData.cost.amount, 100)
        XCTAssertEqual(wrapper.extensionTransactions[0].productData.cost.type, "bits")
        XCTAssertEqual(wrapper.extensionTransactions[0].productData.inDevelopment, false)
        XCTAssertEqual(wrapper.extensionTransactions[0].productData.displayName, "Test Product 100")
        XCTAssertEqual(wrapper.extensionTransactions[0].productData.expiration, "")
        XCTAssertEqual(wrapper.extensionTransactions[0].productData.broadcast, false)
    }
}
