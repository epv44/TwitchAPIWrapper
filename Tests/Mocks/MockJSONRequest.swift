//
//  MockJSONResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation
@testable import TwitchAPIWrapper

class mockJSONRequest: JSONConstructableRequest, RestRequest {
    typealias Model = User
    var url: URL?
    
    init(url: URL) {
        self.url = url
    }
}
