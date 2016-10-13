//
//  AuthError.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/13/16.
//
//

import Foundation
import Gloss

public struct AuthError: Decodable {
    let error: String?
    let message: String?
    let status: String?
}

extension AuthError {
    public init?(json: JSON) {
        self.error = "error" <~~ json
        self.message = "message" <~~ json
        self.status = "status" <~~ json
    }
}
