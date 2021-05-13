//
//  CodeStatus.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/8/21.
//

import Foundation

public struct CodeStatusResponse: Codable {
    public let codeStatuses: [CodeStatus]

    private enum CodingKeys: String, CodingKey {
        case codeStatuses = "data"
    }
}

public enum CodeSuccessStatus: String {
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

public struct CodeStatus: Codable, Equatable {
    public let code: String
    public let status: String
}
