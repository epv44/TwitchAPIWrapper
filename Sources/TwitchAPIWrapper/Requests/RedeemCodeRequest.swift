//
//  RedeemCodeRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/12/21.
//

import Foundation

///Post request to redeem a code:  https://dev.twitch.tv/docs/api/reference/#redeem-code
public struct RedeemCodeRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    
    public init(userID: String, codes: [String]) {
        var queryParams = [URLQueryItem(name: "user_id", value: userID)]
        queryParams.append(contentsOf: codes.constructQueryItems(withKey: "code"))
        self.url = TwitchEndpoints.redeemCode.construct()?.appending(queryItems: queryParams)
    }
}
