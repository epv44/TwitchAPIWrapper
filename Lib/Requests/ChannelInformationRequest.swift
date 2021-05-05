//
//  GetChannelInformationRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

///Get channel information request see https://dev.twitch.tv/docs/api/reference/#get-channel-information for details
public struct ChannelInformationRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(broadcasterID: String) {
        self.url = TwitchEndpoints.channelInformation.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
    }
}
