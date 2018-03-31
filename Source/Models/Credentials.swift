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
    public let scope: [String]?
    
    ///Client id for the user
    public let clientId: String
    
    ///Authorized user login
    public let login: String
    
    ///Authorized user id
    public let userId: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case scope
        case clientId = "client_id"
        case login
        case userId = "user_id"
    }
}

