//
//  CustomRewardRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/7/21.
//

import Foundation

///Get custom reward request see https://dev.twitch.tv/docs/api/reference/#get-custom-reward-redemption for details
public struct CustomRewardRedemptionRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod
    public let data: Data
    
    public init(
        httpMethod: HTTPMethod,
        broadcasterID: String,
        rewardID: String,
        id: String? = nil,
        status: String? = nil,
        sort: String? = nil,
        after: String? = nil,
        first: String? = nil
    ) throws {
        var queryItems = [
            "broadcaster_id": broadcasterID,
            "reward_id": rewardID,
            "id": id,
            "sort": sort,
            "after": after,
            "first": first,
        ]
        if (httpMethod == .get) {
            queryItems["status"] = status
        }
        self.url = TwitchEndpoints.customRewardRedemption.construct()?.appending(
            queryItems: queryItems.buildQueryItems())
        self.method = httpMethod
        if (httpMethod == .post || httpMethod == .patch) {
            let body: [String:String] = [
                "status": status
            ].compactMapValues { val in
                if let v = val {
                    return v
                } else {
                    return nil
                }
            }
            self.data = try JSONSerialization.data(
                withJSONObject: body,
                options: [])
        } else {
            self.data = Data()
        }
    }
}
