//
//  CodeStatus.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/8/21.
//

import Foundation

/// Code status response: https://dev.twitch.tv/docs/api/reference/#get-code-status
public struct CodeStatusResponse: Codable {
    public let codeStatuses: [CodeStatus]

    private enum CodingKeys: String, CodingKey {
        case codeStatuses = "data"
    }
}

/// Code status options mirroring: https://dev.twitch.tv/docs/api/reference/#get-code-status
public enum CodeSuccessStatus: String, Codable {
    case successfullyRedeemed = "SUCCESSFULLY_REDEEMED"
    case alreadyClaimed = "ALREADY_CLAIMED"
    case expired = "EXPIRED"
    case userNotEligible = "USER_NOT_ELIGIBLE"
    case notFound = "NOT_FOUND"
    case inactive = "INACTIVE"
    case unused = "UNUSED"
    case incorrectFormat = "INCORRECT_FORMAT"
    case internalError = "INTERNAL_ERROR"
}

/// Code status object returned from the server as part of the `CodeStatusResponse` https://dev.twitch.tv/docs/api/reference/#get-code-status
public struct CodeStatus: Codable, Equatable {
    public let code: String
    public let status: CodeSuccessStatus
}
