//
//  ExtensionTransactions.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation


public struct ExtensionTransactionsResponse: Codable {
    public let extensionTransactions: [ExtensionTransaction]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case extensionTransactions = "data"
        case pagination
    }
}

public struct ExtensionTransaction: Codable, Equatable {
    public let id: String
    public let timestamp: Date
    public let broadcastId: String
    public let broadcasterLogin: String
    public let broadcasterName: String
    public let userId: String
    public let userName: String
    public let productType: String
    public let productData: ProductData
}

public struct ProductData: Codable, Equatable {
    public let sku: String
    public let cost: ExtensionTransactionCost
    public let displayName: String
    public let inDevelopment: Bool
    
    private enum CodingKeys: String, CodingKey {
        case sku
        case cost
        case displayName = "displayName"
        case inDevelopment = "inDevelopment"
    }
}

public struct ExtensionTransactionCost: Codable, Equatable {
    public let amount: Int
    public let type: String
}
