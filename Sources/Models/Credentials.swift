//
//  Credentials.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/13/16.
//
//

import Foundation
import Gloss

public struct Credentials: Decodable {
    let accessToken: String?
    let scope: String?
    let refreshToken: String?
}

extension Credentials {
    public init?(json: JSON) {
        self.accessToken = "access_token" <~~ json
        self.scope = "scope" <~~ json
        self.refreshToken = "refresh_token" <~~ json
    }
}
