//
//  ExtensionTransactions.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

/// Respone object for the extension transactions request: https://dev.twitch.tv/docs/api/reference/#get-extension-transactions
public struct ExtensionTransactionsResponse: Codable {
    public let extensionTransactions: [ExtensionTransaction]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case extensionTransactions = "data"
        case pagination
    }
}

/// Individual extension transaction object as part of the `ExtensionTransactionsRequest` see: https://dev.twitch.tv/docs/api/reference/#get-extension-transactions
public struct ExtensionTransaction: Codable, Equatable {
    public let id: String
    public let timestamp: Date
    public let broadcasterId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let userId: String
    public let userName: String
    public let userLogin: String
    public let productType: String
    public let productData: ProductData
}

/// ProductData related to an extension transaction see: https://dev.twitch.tv/docs/api/reference/#get-extension-transactions
public struct ProductData: Codable, Equatable {
    public let sku: String
    public let cost: ExtensionTransactionCost
    public let displayName: String
    public let inDevelopment: Bool
    public let domain: String
    public let expiration: String
    public let broadcast: Bool
    
    private enum CodingKeys: String, CodingKey {
        case sku
        case cost
        case displayName = "displayName"
        case inDevelopment = "inDevelopment"
        case domain
        case expiration
        case broadcast
    }
}

/// Data related to an extenstion transaction: https://dev.twitch.tv/docs/api/reference/#get-extension-transactions
public struct ExtensionTransactionCost: Codable, Equatable {
    public let amount: Int
    public let type: String
}
