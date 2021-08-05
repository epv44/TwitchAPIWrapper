//
//  ChannelEditors.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

///Get channel editors request see https://dev.twitch.tv/docs/api/reference/#get-channel-editors for details
public struct ChannelEditorRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(broadcasterID: String) {
        self.url = TwitchEndpoints.channelEditor.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
    }
}
