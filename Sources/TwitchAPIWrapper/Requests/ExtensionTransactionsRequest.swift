//
//  ExtensionTransactionsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

///Get extension transactions request, see https://dev.twitch.tv/docs/api/reference/#get-extension-transactions for details
public struct ExtensionTransactionsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        extensionID: String,
        ids: [String]? = nil,
        after: String? = nil,
        first: String? = nil
    ) {
        var queryItems = [
            "extension_id": extensionID,
            "after": after,
            "first": first
        ].buildQueryItems()
        if let userIds = ids {
            queryItems.append(contentsOf: userIds.constructQueryItems(withKey: "id"))
        }
        self.url = TwitchEndpoints.extensionTransactions.construct()?.appending(queryItems: queryItems)
    }
}


