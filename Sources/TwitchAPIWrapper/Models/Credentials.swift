//
//  Credentials.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/13/16.
//
//

import Foundation

///A `Credential` is holds the fields returned from a succesfull authentication request.
public struct Credentials: Codable {
    ///Access token from the server.
    public let accessToken: String?
    
    ///Scopes that the user is authorized as granted by the server.
    public let scopes: [String]?
    
    public init(accessToken: String, scopes: [String]) {
        self.accessToken = accessToken
        self.scopes = scopes
    }
}

