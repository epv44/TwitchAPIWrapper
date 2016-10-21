//
//  TwitchAPIResourceTests.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/20/16.
//
//

import XCTest

@testable import TwitchAPIWrapper

// Test resource Structs
class TwitchAPIUserResourceTests: XCTestCase {
    
    //Given JSON Dictionary representing a User
    func testBuildUserModelFromJSON() {
        let ur = UsersResource()
        let jsonDict: [String: AnyObject] = ["type": "user" as AnyObject,
                                             "name" : "Marshal Mathers" as AnyObject,
                                             "created_at" : "2011-03-19T15:42:22Z" as AnyObject,
                                             "updated_at": "2012-06-14T00:14:27Z" as AnyObject,
                                             "_links": "https://api.twitch.tv/kraken/users/test_user1" as AnyObject,
                                             "logo": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_user1-profile_image-6947308654ad603f-300x300.jpeg" as AnyObject,
                                             "_id": "21229404" as AnyObject,
                                             "display_name": "Eminem" as AnyObject,
                                             "bio": "test bio woo I'm a test user" as AnyObject]
        let user = ur.model(from: jsonDict)
        XCTAssertEqual(user?.name, "Marshal Mathers")
        XCTAssertEqual(user?.displayName, "Eminem")
    }
}
