//
//  CustomRewardRedemption.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/7/21.
//

import Foundation

/// RewardRedemption Response Object From https://dev.twitch.tv/docs/api/reference/#get-custom-reward-redemption
public struct CustomRewardRedemptionResponse: Codable {
    public let rewardRedemptions: [CustomRewardRedemption]
    public let pagination: Paginate?

    private enum CodingKeys: String, CodingKey {
        case rewardRedemptions = "data"
        case pagination
    }
}

/// Specific reward info returned from https://dev.twitch.tv/docs/api/reference/#get-custom-reward-redemption
public struct RewardInfo: Codable, Equatable {
    public let id: String
    public let title: String
    public let prompt: String
    public let cost: Int
}

/// Reward status as mapped in the API: https://dev.twitch.tv/docs/api/reference/#get-custom-reward-redemption
public enum RewardStatus: String, Codable {
    case UNFULFILLED, FULFILLED, CANCELED
}

/// Reward object as part of the `CustomRewardRedemptionResponse` from https://dev.twitch.tv/docs/api/reference/#get-custom-reward-redemption
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
