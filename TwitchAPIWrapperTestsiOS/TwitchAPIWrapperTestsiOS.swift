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
    
    func testJSONResource() {
        //buidl request and then call response on the built request
        let mjsr = mockJSONResource()
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
