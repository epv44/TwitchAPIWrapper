//
//  Video.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public enum Viewable: String, Codable {
    case `public`
    case `private`
}

public enum VideoType: String, Codable {
    case upload
    case archive
    case highlight
    case all
}

public struct MutedSegment: Codable, Equatable {
    let duration: String
    let offset: String
}

public struct VideoResponse: Codable {
    public let videos: [Video]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case videos = "data"
        case pagination
    }
}

public struct Video: Codable, Equatable {
    public let id: String
    public let streamId: String
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
