//
//  mockAuthorizationResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/20/16.
//
//

import Foundation

@testable import TwitchAPIWrapper

class MockAuthorizationRequest: JSONConstructableRequest, RestRequest {
    typealias Model = User
    var url: URL?
    
    init(url: URL) {
        self.url = url
    }
}
