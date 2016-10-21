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
}
