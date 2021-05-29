//
//  DeleteVideoResponse.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/28/21.
//

import Foundation

/// Response object for the delete video request see: https://dev.twitch.tv/docs/api/reference/#delete-videos
public struct DeleteVideoResponse: Codable {
    /// Date returned - list of id's
    public let data: [String]
}
