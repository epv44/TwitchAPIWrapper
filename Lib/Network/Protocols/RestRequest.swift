//
//  Request.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

protocol RestRequest {
    var url: URL? { get }
    var method: HTTPMethod { get }
    var data: Data { get }
    var headers: [String: String] { get }
}

extension RestRequest {
    var method: HTTPMethod { return .get }
    var data: Data { return Data() }
    var headers: [String:String] {
        guard let authToken = TwitchAuthorizationManager.sharedInstance.authToken,
              let clientID = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify auth token and clientID to make rest request", line: #line, fileName: #file)
            return [:]
        }
        return ["Authorization": "Bearer \(authToken)", "Client-Id": clientID]
    }
}
