//
//  CreateCustomAwardRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

///Create custom award request see https://dev.twitch.tv/docs/api/reference/#create-custom-rewards for details
public struct CreateCustomAwardRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        broadcasterID: String,
        title: String,
        cost: String,
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
        shouldRedemptionsSkipRequestQueue: String? = nil
    ) throws {
        self.url = TwitchEndpoints.customAwards.construct()?.appending(
            queryItems: [
                "broadcaster_id": broadcasterID,
                "title": title,
                "cost": cost,
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
                "should_redemptions_skip_request_queue": shouldRedemptionsSkipRequestQueue as Any
            ].buildQueryItems())
    }
}
