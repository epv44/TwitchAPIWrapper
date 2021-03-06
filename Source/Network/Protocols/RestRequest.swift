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
    var method: String { get }
    var data: Data { get }
    var headers: [String: String] { get }
}

extension RestRequest {
    var method: String { return "GET" }
    var data: Data { return Data() }
    var headers: [String:String] { return [:] }
}
