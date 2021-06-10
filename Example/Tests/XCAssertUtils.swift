//
//  XCAssertUtils.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/25/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

func XCTAssertEqual(
  _ actual: String, // the string under test
  expectedURL expected: String, // the reference string
  file: StaticString = #file, // the file the function is called from
  line: UInt = #line // the line the function is called from
) {
    let actualURL = URLComponents(string: actual)
    let expectedURL = URLComponents(string: expected)
    XCTAssertEqual(actualURL?.url?.host, expectedURL?.url?.host)
    XCTAssertEqual(actualURL?.url?.path, expectedURL?.url?.path)
    XCTAssertEqual(
        actualURL?.queryItems?.sorted(by: { $0.name < $1.name }),
        expectedURL?.queryItems?.sorted(by: { $0.name < $1.name } ),
        file: file,
        line: line)
}
