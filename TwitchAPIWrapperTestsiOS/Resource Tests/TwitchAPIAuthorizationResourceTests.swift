////
////  TwitchAPIAuthorizationResourceTests.swift
////  TwitchAPIWrapper
////
////  Created by Eric Vennaro on 10/20/16.
////
////
//
//import XCTest
//
//@testable import TwitchAPIWrapper
//
//class TwitchAPIAuthorizationTests: XCTestCase {
//    
//    //Given JSON Dictionary representing a Credential
//    func testBuildCredentialModelFromJSON() {
//        let ar = AuthorizationResource(data: Data(), url: URL(string: "http://www.google.com")!)
//        let jsonDict = ["access_token" : "12345" as AnyObject,
//                        "refresh_token" : "9876" as AnyObject,
//                        "scope" : ["user_read", "user_write"] as AnyObject]
//        let credential = ar.model(from: jsonDict)
//        XCTAssertEqual(credential!.accessToken, "12345")
//        XCTAssertEqual(credential!.refreshToken, "9876")
//        XCTAssertEqual(credential!.scope![0], "user_read")
//    }
//    
//    func testAuthorizationParams() {
//        let data = "client_id=myclient".data(using: .ascii)
//        let url = URL(string: "http://www.google.com")!
//        let ar = AuthorizationResource(data: data!, url: url)
//        XCTAssertEqual(data, ar.data)
//        XCTAssertEqual("POST", ar.method)
//        XCTAssertEqual(url, ar.url)
//    }
//    
//}

