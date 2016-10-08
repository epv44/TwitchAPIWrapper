//
//  MockJSONResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation
@testable import TwitchAPIWrapper

class mockJSONResource: ConstructableRequest, JSONResource {
    typealias Model = User
    var baseUrl: URL? = nil
    //mock, not what we are testing
    func buildRequest() -> URLRequest? { return nil }
}
