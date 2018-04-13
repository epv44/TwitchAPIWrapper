//
//  AuthenticationResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/14/16.
//
//

import Foundation

struct AuthorizationResource: JSONConstructableRequest {
    typealias Model = Credentials
    let url: URL?
    let method: HTTPMethod = .post
    let data: Data
    
    public init(data: Data, url: URL) {
        self.data = data
        self.url = url
    }
}
