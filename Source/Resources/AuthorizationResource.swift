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
    let method: String = "POST"
    let data: Data
    
    init(data: Data, url: URL) {
        self.data = data
        self.url = url
    }
}
