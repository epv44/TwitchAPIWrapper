//
//  EntitlementGrantUploadTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/11/18.
//

import XCTest

@testable import TwitchAPIWrapper

class EntitlementGrantUploadTests: XCTestCase {
    func testBuildEntitlementGrantUploadModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let wrapper = try decoder.decode(EntitlementGrantUploadWrapper.self, from: Fixtures.dataFromFixtureFile("EntitlementGrantUpload"))
            let grant = wrapper.uploads[0]
            XCTAssertEqual(grant.url.absoluteString, URL(string: "https://twitch-ds-vhs-drops-granted-uploads-us-west-2-prod.s3-us-west-2.amazonaws.com")?.absoluteString)
        } catch {
            print(error)
        }
    }
}

