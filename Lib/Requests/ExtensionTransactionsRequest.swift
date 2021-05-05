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
        id: String? = nil,
        after: String? = nil,
        first: String? = nil
    ) {
        self.url = TwitchEndpoints.analyticsExtension.construct()?.appending(
            queryItems: [
                "extension_id": extensionID,
                "id": id,
                "after": after,
                "first": first
            ].buildQueryItems())
    }
}


