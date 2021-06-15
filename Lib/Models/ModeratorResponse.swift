//
//  ModeratorResponse.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

public struct ModeratorResponse: Codable {
    public let moderators: [Moderator]
    public let pagination: Paginate

    private enum CodingKeys: String, CodingKey {
        case moderators = "data"
        case pagination
    }
}

public struct Moderator: Codable, Equatable {
    public let userId: String
    public let userLogin: String
    public let userName: String
}
