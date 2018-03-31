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
    //based off of endpoint: GET/users/:user
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
            XCTAssertEqual(user.offlineImageURL, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/dallas-channel_offline_image-1a2c906ee2c35f12-1920x1080.png"))
            XCTAssertEqual(user.profileImageURL, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/dallas-profile_image-1a2c906ee2c35f12-300x300.png"))
            XCTAssertEqual(user.type, UserType.staff)
            XCTAssertEqual(user.viewCount, 191836881)
        } catch {
            print(error)
        }
    }
//    //based off of endpoint: GET/user 
//    func testUserWithAuthentication() {
//        let userDict = ["type": "user" as AnyObject,
//                    "name": "test_user1" as AnyObject,
//                    "created_at": "2011-06-03T17:49:19Z" as AnyObject,
//                    "updated_at": "2012-06-18T17:19:57Z" as AnyObject,
//                    "_links": ["self": "https://api.twitch.tv/kraken/users/test_user1"] as AnyObject,
//                    "logo": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_user1-profile_image-62e8318af864d6d7-300x300.jpeg" as AnyObject,
//                    "_id": 22761313 as AnyObject,
//                    "display_name": "test_user1" as AnyObject,
//                    "email": "asdf@asdf.com" as AnyObject,
//                    "partnered": true as AnyObject,
//                    "bio": "test bio woo I'm a test user" as AnyObject,
//                    "notifications": ["email": true, "push": false] as AnyObject
//        ]
//        let user = User(json: userDict)
//        XCTAssertEqual(user!.email, "asdf@asdf.com")
//        XCTAssertEqual(user!.partnered, true)
//        XCTAssertEqual(user!.notifications!["email"], true)
//    }
}

