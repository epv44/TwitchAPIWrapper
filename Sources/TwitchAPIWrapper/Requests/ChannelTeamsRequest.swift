//
//  ChannelTeamsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

///Get channel information request see https://dev.twitch.tv/docs/api/reference/#get-channel-teams for details
public struct ChannelTeamsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(broadcasterID: String) {
        self.url = TwitchEndpoints.channelTeams.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
    }
}
