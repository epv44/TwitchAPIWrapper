//
//  Video.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

/// Viewable type on the video response object see https://dev.twitch.tv/docs/api/reference/#get-videos
public enum Viewable: String, Codable {
    case `public`
    case `private`
}

///Allowable types for the video response object see https://dev.twitch.tv/docs/api/reference/#get-videos
public enum VideoType: String, Codable {
    case upload
    case archive
    case highlight
    case all
}

///Specific type on the Video response object see https://dev.twitch.tv/docs/api/reference/#get-videos
public struct MutedSegment: Codable, Equatable {
    let duration: Int
    let offset: Int
}

///Wrapper object for the get videos request see https://dev.twitch.tv/docs/api/reference/#get-videos
public struct VideoResponse: Codable {
    ///List of `Video`'s returned
    public let videos: [Video]
    ///Pagination cursor information
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case videos = "data"
        case pagination
    }
}

///Video response object see https://dev.twitch.tv/docs/api/reference/#get-videos
public struct Video: Codable, Equatable {
    public let id: String
    public let streamId: String?
    public let userId: String
    public let userLogin: String
    public let userName: String
    public let title: String
    public let description: String
    public let createdAt: Date
    public let publishedAt: Date
    public let url: URL
    public let thumbnailUrl: String
    public let viewable: Viewable
    public let viewCount: Int
    public let language: String
    public let type: VideoType
    public let duration: String
    public let mutedSegments: [MutedSegment]?
}
