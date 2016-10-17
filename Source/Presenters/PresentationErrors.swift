//
//  PresentationErrors.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/17/16.
//
//

import Foundation
///Describes errors that occur in the presentation layer
public enum PresentationError: Error {
    /**
     Specifies that the authorization token is missing.
     
     - parameter desc: Describes error.
     */
    case noAuthorizationToken(desc: String)
    /**
     Specifies that the client-id is missing and must be specified.
     
     - parameter desc: Describes error.
    */
    case noClientId(desc: String)
}
