//
//  Credentials.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/13/16.
//
//

import Foundation
//import Gloss

///A `Credential` is holds the fields returned from a succesfull authentication request.
public struct Credentials {
    ///Access token from the server.
    public let accessToken: String?
    
    ///Scopes that the user is authorized as granted by the server.
    public let scope: [String]?
    
    ///Refresh token from the server, note that Twitch tokens do not expire.
    public let refreshToken: String?
}

////MARK: - Init Extension.
//extension Credentials {
//    /**
//     Constructs a new credential.
//     
//     - parameter json: The `[String : Any]` dictionary returned from the network.
//     
//     - returns: A new `Credential` instance.
//    */
//    public init?(json: JSON) {
//        self.accessToken = "access_token" <~~ json
//        self.scope = "scope" <~~ json
//        self.refreshToken = "refresh_token" <~~ json
//    }
//}

