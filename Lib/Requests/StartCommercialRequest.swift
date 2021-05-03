//
//  StartCommercialRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

public struct StartCommercialRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod = .post
    public let data: Data
    
    public init(broadcasterID: String, length: Int) throws {
        self.data = try JSONSerialization.data(withJSONObject: ["broadcaster_id": broadcasterID, "length": length], options: [])
        self.url = TwitchEndpoints.startCommercial.construct()
    }
}
