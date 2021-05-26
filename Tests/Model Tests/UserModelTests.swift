//
//  UserModelTests.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/20/16.
//
//

import XCTest

@testable import TwitchAPIWrapper

class UserModelTests: XCTestCase {
    //based off of endpoint: .get/users/:user
    func testUserWithoutAuthentication() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let wrapper = try decoder.decode(UserWrapper.self, from: Fixtures.dataFromFixtureFile("Game"))
            let user = wrapper.users[0]
            XCTAssertEqual(user.broadcasterType, BroadcasterType.none)
            XCTAssertEqual(user.description, "Just a gamer playing games and chatting. :)")
            XCTAssertEqual(user.displayName, "dallas")
            XCTAssertEqual(user.email, "login@provider.com")
            XCTAssertEqual(user.id, "44322889")
            XCTAssertEqual(user.login, "dallas")
            XCTAssertEqual(user.offlineImageURL.absoluteString, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/dallas-channel_offline_image-1a2c906ee2c35f12-1920x1080.png")?.absoluteString)
            XCTAssertEqual(user.profileImageURL.absoluteString, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/dallas-profile_image-1a2c906ee2c35f12-300x300.png")?.absoluteString)
            XCTAssertEqual(user.type, UserType.staff)
            XCTAssertEqual(user.viewCount, 191836881)
        } catch {
            print(error)
        }
    }
}

