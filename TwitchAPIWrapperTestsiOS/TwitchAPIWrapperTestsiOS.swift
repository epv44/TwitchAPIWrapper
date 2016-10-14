//
//  TwitchAPIWrapperTestsiOS.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 10/6/16.
//
//

import XCTest

@testable import TwitchAPIWrapper

class TwitchAPIWrapperTestsiOS: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBuilJSONRequest() {
        //build request and then call response on the built request
        let mjr = mockJSONRequest(url: URL(string: "www.google.com")!)
        let request = mjr.buildRequest()
        let method = request?.httpMethod
        let url = request?.url?.absoluteString
        XCTAssertEqual(method, "GET")
        XCTAssertEqual(url, "www.google.com")
    }
    
    func testAuthConfigVars() {
        TwitchAuthorizationManager.sharedInstance.clientID = "id"
        TwitchAuthorizationManager.sharedInstance.clientSecret = "secret"
        TwitchAuthorizationManager.sharedInstance.redirectURI = "callback"
        TwitchAuthorizationManager.sharedInstance.scopes = "scope"
        
        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.clientID, "id")
        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.clientSecret, "secret")
        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.redirectURI, "callback")
        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.scopes, "scope")
    }
    
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
    
    func testBuildCredentailsModelFromJSON() {
        let jsonDict: [String: AnyObject] = ["access_token" : "accesstoken" as AnyObject, "refresh_token" : "refreshtoken" as AnyObject, "scope" : ["scope1", "scope2"] as AnyObject]
        let credentials = Credentials(json: jsonDict)
        XCTAssertEqual(credentials?.accessToken, "accesstoken")
        XCTAssertEqual(credentials?.refreshToken, "refreshtoken")
        XCTAssertEqual(credentials?.scope![0], "scope1")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
