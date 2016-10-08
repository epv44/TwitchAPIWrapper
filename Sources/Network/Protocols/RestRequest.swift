//
//  Request.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

protocol RestRequest {
    var baseUrl: URL? { get }
    var method: String { get }
    var pathh: String { get }
    var parameters: [String:String] { get }
    var headers: [String: String] { get }
}

extension RestRequest {
    var method: String { return "get" }
    var pathh: String { return "" }
    var parameters: [String:String] { return [:] }
    var headers: [String:String] { return [:] }
}
