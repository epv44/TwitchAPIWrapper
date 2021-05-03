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

class VideoWrapper: Codable {
    let videos: [Video]
    let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case videos = "data"
        case pagination
    }
}

public struct Video: Codable, Equatable {
    let id: String
    let streamId: String
    let userId: String
    let userLogin: String
    let userName: String
    let title: String
    let description: String
    let createdAt: Date
    let publishedAt: Date
    let url: URL
    let thumbnailUrl: String
    let viewable: Viewable
    let viewCount: Int
    let language: String
    let type: VideoType
    let duration: String
    let mutedSegments: [MutedSegment]?
}
