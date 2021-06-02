//
//  EmptyResponse.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

/// Dummy object to feed into the system. This is probably not the best approach, but
/// it represents when you respect the server to return No Content
public struct EmptyResponse: Codable {}
