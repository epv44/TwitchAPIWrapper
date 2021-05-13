//
//  CreateCustomAwardRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

///Get, Create, or delete custom award request see
/// https://dev.twitch.tv/docs/api/reference/#create-custom-rewards
/// https://dev.twitch.tv/docs/api/reference/#update-custom-reward
/// and https://dev.twitch.tv/docs/api/reference/#delete-custom-reward for details
public struct CustomRewardRequest: JSONConstructableRequest {
    public let url: URL?
    public let method: HTTPMethod
    public let data: Data
    
    public init(
        httpMethod: HTTPMethod,
        broadcasterID: String,
        id: String? = nil,
        title: String? = nil,
        cost: String? = nil,
        prompt: String? = nil,
        isEnabled: String? = nil,
        backgroundColor: String? = nil,
        isUserInputRequired: String? = nil,
        isMaxPerStreamEnabled: String? = nil,
        maxPerStream: String? = nil,
        isMaxPerUserPerStreamEnabled: String? = nil,
        maxPerUserPerStream: String? = nil,
        isGlobalCooldownEnabled: String? = nil,
        globalCooldownSeconds: String? = nil,
        shouldRedemptionsSkipRequestQueue: String? = nil,
        onlyManageableRewards: String? = nil,
        isPaused: String? = nil
    ) throws {
        if (httpMethod == .post && (title == nil || cost == nil)) {
            throw RequestValidationError.invalidInput("For create (POST) title and cost are required non null values")
        }
        self.url = TwitchEndpoints.customRewards.construct()?.appending(
            queryItems: [
                "broadcaster_id": broadcasterID,
                "id": id,
                "only_manageable_rewards": onlyManageableRewards
            ].buildQueryItems())
        self.method = httpMethod
        if (httpMethod == .post || httpMethod == .patch) {
            let body: [String:String] = [
                "title": title as Any,
                "cost": cost as Any,
                "prompt": prompt as Any,
                "is_enabled": isEnabled as Any,
                "background_color": backgroundColor as Any,
                "is_user_input_required": isUserInputRequired as Any,
                "is_max_per_stream_enabled": isMaxPerStreamEnabled as Any,
                "max_per_stream": maxPerStream as Any,
                "is_max_per_user_per_stream_enabled": isMaxPerUserPerStreamEnabled as Any,
                "max_per_user_per_stream": maxPerUserPerStream as Any,
                "is_global_cooldown_enabled": isGlobalCooldownEnabled as Any,
                "global_cooldown_seconds": globalCooldownSeconds as Any,
                "should_redemptions_skip_request_queue": shouldRedemptionsSkipRequestQueue as Any,
                "is_paused": isPaused as Any
            ].compactMapValues { val in
                if let v = val as? String {
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
