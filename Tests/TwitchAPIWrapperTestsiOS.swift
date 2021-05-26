////
////  TwitchAPIWrapperTestsiOS.swift
////  TwitchAPIWrapperTestsiOS
////
////  Created by Eric Vennaro on 10/6/16.
////
////
//
//import XCTest
//
//@testable import TwitchAPIWrapper
//
//class TwitchAPIWrapperTestsiOS: XCTestCase {
//    
//    func testBuilJSONRequest() {
//        //build request and then call response on the built request
//        let mjr = mockJSONRequest(url: URL(string: "www.google.com")!)
//        let request = mjr.buildRequest()
//        let method = request?.httpMethod
//        let url = request?.url?.absoluteString
//        XCTAssertEqual(method, .get)
//        XCTAssertEqual(url, "www.google.com")
//    }
//    (
//    func testAuthConfigVars() {
//        TwitchAuthorizationManager.sharedInstance.clientID = "id"
//        TwitchAuthorizationManager.sharedInstance.clientSecret = "secret"
//        TwitchAuthorizationManager.sharedInstance.redirectURI = "callback"
//        TwitchAuthorizationManager.sharedInstance.scopes = "scope"
//        
//        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.clientID, "id")
//        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.clientSecret, "secret")
//        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.redirectURI, "callback")
//        XCTAssertEqual(TwitchAuthorizationManager.sharedInstance.scopes, "scope")
//    }
//    
//    
//    func testValidJSONResourceResult() {
//        let mjr = MockJSONResource()
//        let jsonUser: [String: Any] = ["type": "user",
//                        "name": "test_user1",
//                        "created_at": "2011-03-19T15:42:22Z",
//                        "updated_at": "2012-06-14T00:14:27Z",
//                        "_links": ["self": "https://api.twitch.tv/kraken/users/test_user1"],
//                        "logo": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_user1-profile_image-6947308654ad603f-300x300.jpeg",
//                        "_id": 21229404,
//                        "display_name": "test_user1",
//                        "bio": "test bio woo I'm a test user"
//        ]
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: jsonUser, options: .prettyPrinted)
//            let result = mjr.result(from: jsonData)
//            switch result {
//            case .failure(_):
//                XCTFail()
//            case let .success(r):
//                XCTAssertEqual(r.name, "test_user1")
//            }
//        } catch {
//            XCTFail("Bad JSON Data")
//        }
//    }
//    
//    func testDictionaryParsingError() {
//        let mjr = MockJSONResource()
//        do {
//            let jsonData = Data()
//            let result = mjr.result(from: jsonData)
//            switch result {
//            case let .failure(err):
//                switch err {
//                case ParsingError.invalidJSONData:
//                    XCTAssert(true)
//                default:
//                    XCTFail("Wrong error message returned")
//                    
//                }
//            case .success(_):
//                XCTFail("This should produce an error")
//            }
//        }
//    }
//    
//    //test array parsing which is unsupported
//    func testArrayParsingError() {
//        let mjr = MockJSONResource()
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: ["user", "secondUser", "ThirdUser"], options: .prettyPrinted)
//            let result = mjr.result(from: jsonData)
//            switch result {
//            case let .failure(err):
//                switch err {
//                case ParsingError.cannotParseJSONArray:
//                    XCTAssert(true)
//                default:
//                    XCTFail("Wrong error message returned")
//                    
//                }
//            case .success(_):
//                XCTFail("should throw ParsingError")
//            }
//        } catch {
//            XCTFail("Failure to parse")
//        }
//    }
//}

