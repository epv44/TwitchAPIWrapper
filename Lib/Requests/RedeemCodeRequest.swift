//
//  RedeemCodeRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/12/21.
//

import Foundation

public struct RedeemCodeRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    
    public init(userID: String, codes: [String]) {
        var queryParams = [URLQueryItem(name: "user_id", value: userID)]
        for code in codes {
            queryParams.append(URLQueryItem(name: "code", value: code))
        }
        self.url = TwitchEndpoints.redeemCode.construct()?.appending(queryItems: queryParams)
    }
}
