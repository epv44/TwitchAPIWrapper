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

class VideoWrapper: Codable {
    let videos: [Video]
    
    private enum CodingKeys: String, CodingKey {
        case videos = "data"
    }
}

public struct Video: Codable, Equatable {
    let id: String
    let userId: String
    let title: String
    let description: String
    let createdAt: Date
    let publishedAt: Date
    let url: URL
    let thumbnailURL: URL
    let viewable: Viewable
    let viewCount: Int
    let language: String
    let type: VideoType
    let duration: String //should be a timestamp, or need some type of custom key
}
