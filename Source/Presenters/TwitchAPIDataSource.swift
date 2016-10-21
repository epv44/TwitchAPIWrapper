//
//  TwitchAPIDataSource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import Foundation

///An instance conforming to 'TwitchAPIDataSource' represents a class that loads a network resource.
public protocol TwitchAPIDataSource: class {
    /**
     Called when the loading process begins.
     
     - parameter resource: The `TwitchResource` that corresponds to the presenter implementing the DataSource.
    */
    func startLoading(for resource: TwitchResource)
    /**
     Called when the loading process has completed.
     
     - parameter resource: The `TwitchResource` that corresponds to the presenter implementing the DataSource.
    */
    func finishLoading(for: TwitchResource)
    /**
     Return a resource.
     
     - parameter resource: The resource returned from the network.
     */
    func set<T>(resource: T)
    /**
     `Error` returned from the network.
     
     - parameter error: The error returned from the network.
     */
    func handle(error: Error)
}

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

///Specifies the type of resource.
public enum TwitchResource: String {
    ///Represents a `User` as defined by the Twitch API.
    case user = "User"
    ///Represents a `Emote` as defined by the Twitch API.
    case emote = "Emote"
}
