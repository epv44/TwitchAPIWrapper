//
//  CustomRewardRedemption.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/7/21.
//

import Foundation

public struct CustomRewardRedemptionResponse: Codable {
    public let rewardRedemptions: [CustomRewardRedemption]
    public let pagination: Paginate?

    private enum CodingKeys: String, CodingKey {
        case rewardRedemptions = "data"
        case pagination
    }
}

public struct RewardInfo: Codable, Equatable {
    public let id: String
    public let title: String
    public let prompt: String
    public let cost: Int
}

public enum RewardStatus: String, Codable {
    case UNFULFILLED, FULFILLED, CANCELED
}

public struct CustomRewardRedemption: Codable, Equatable {
    public let broadcasterId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let id: String
    public let userLogin: String
    public let userId: String
    public let userName: String
    public let reward: RewardInfo
    public let userInput: String
    public let status: RewardStatus
    public let redeemedAt: Date
}
