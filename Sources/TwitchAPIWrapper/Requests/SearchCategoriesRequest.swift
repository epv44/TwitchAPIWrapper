//
//  SearchCategoriesRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

// GET search categories see: https://dev.twitch.tv/docs/api/reference/#search-categories
public struct SearchCategoriesRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(query: String, first: String? = nil, after: String? = nil) {
        self.url = TwitchEndpoints.searchCategories.construct()?.appending(
            queryItems: ["query": query, "first": first, "after": after].buildQueryItems())
    }
}

