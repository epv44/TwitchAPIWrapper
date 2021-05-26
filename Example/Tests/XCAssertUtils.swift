//
//  XCAssertUtils.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/25/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

func XCTAssertEqual(
  _ actualURL: String, // the string under test
  expectedURL: String, // the reference string
  file: StaticString = #file, // the file the function is called from
  line: UInt = #line // the line the function is called from
) {
    XCTAssertEqual(
        URLComponents(string: actualURL)!.queryItems!.sorted(by: { $0.name < $1.name }),
        URLComponents(string: expectedURL)!.queryItems!.sorted(by: { $0.name < $1.name } ),
        file: file,
        line: line)
}
