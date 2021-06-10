//
//  StreamTagResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class StreamTagResponseTests: XCTestCase {
    
    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(StreamTagResponse.self, from: Fixtures.dataFromFixtureFile("StreamTags"))
        XCTAssertEqual(wrapper.streamTags[0].tagId, "6ea6bca4-4712-4ab9-a906-e3336a9d8039")
        XCTAssertEqual(wrapper.streamTags[0].isAuto, true)
        XCTAssertEqual(wrapper.streamTags[0].localizationNames, ["bg-bg": "английски",
                                                                 "cs-cz": "Angličtina",
                                                                 "da-dk": "Engelsk",
                                                                 "de-de": "Englisch",
                                                                 "el-gr": "Αγγλικά",
                                                                 "en-us": "English"])
        XCTAssertEqual(wrapper.streamTags[0].localizationDescriptions, ["bg-bg": "За потоци с използване на английски",
                                                                        "cs-cz": "Pro vysílání obsahující angličtinu.",
                                                                        "da-dk": "Til streams, hvori der indgår engelsk",
                                                                        "de-de": "Für Streams auf Englisch.",
                                                                        "el-gr": "Για μεταδόσεις που περιλαμβάνουν τη χρήση Αγγλικών",
                                                                        "en-us": "For streams featuring the use of English"])
        XCTAssertEqual(wrapper.pagination?.cursor, "eyJiI...")
    }
}
