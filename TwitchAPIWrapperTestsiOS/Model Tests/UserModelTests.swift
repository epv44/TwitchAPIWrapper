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
        let userDict = ["type": "user" as AnyObject,
                    "name": "test_user1" as AnyObject,
                    "created_at": "2011-03-19T15:42:22Z" as AnyObject,
                    "updated_at": "2012-06-14T00:14:27Z" as AnyObject,
                    "_links": ["self": "https://api.twitch.tv/kraken/users/test_user1"] as AnyObject,
                    "logo": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_user1-profile_image-6947308654ad603f-300x300.jpeg" as AnyObject,
                    "_id": 21229404 as AnyObject,
                    "display_name": "test_user1" as AnyObject,
                    "bio": "test bio woo I'm a test user" as AnyObject
        ]
        let user = User(json: userDict)
        XCTAssertEqual(user!.type, "user")
        XCTAssertEqual(user!.name, "test_user1")
        XCTAssertEqual(user!.createdAt, "2011-03-19T15:42:22Z")
        XCTAssertEqual(user!.updatedAt, "2012-06-14T00:14:27Z")
        XCTAssertEqual(user!.links!["self"], "https://api.twitch.tv/kraken/users/test_user1")
        XCTAssertEqual(user!.logo, "http://static-cdn.jtvnw.net/jtv_user_pictures/test_user1-profile_image-6947308654ad603f-300x300.jpeg")
        XCTAssertEqual(user!.id, 21229404)
        XCTAssertEqual(user!.displayName, "test_user1")
        XCTAssertEqual(user!.bio, "test bio woo I'm a test user")
        
    }
    
    //based off of endpoint: GET/user 
    func testUserWithAuthentication() {
        let userDict = ["type": "user" as AnyObject,
                    "name": "test_user1" as AnyObject,
                    "created_at": "2011-06-03T17:49:19Z" as AnyObject,
                    "updated_at": "2012-06-18T17:19:57Z" as AnyObject,
                    "_links": ["self": "https://api.twitch.tv/kraken/users/test_user1"] as AnyObject,
                    "logo": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_user1-profile_image-62e8318af864d6d7-300x300.jpeg" as AnyObject,
                    "_id": 22761313 as AnyObject,
                    "display_name": "test_user1" as AnyObject,
                    "email": "asdf@asdf.com" as AnyObject,
                    "partnered": true as AnyObject,
                    "bio": "test bio woo I'm a test user" as AnyObject,
                    "notifications": ["email": true, "push": false] as AnyObject
        ]
        let user = User(json: userDict)
        XCTAssertEqual(user!.email, "asdf@asdf.com")
        XCTAssertEqual(user!.partnered, true)
        XCTAssertEqual(user!.notifications!["email"], true)
    }
}
