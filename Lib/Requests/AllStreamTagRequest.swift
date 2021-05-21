//
//  AllStreamTagRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

///Get streams request https://dev.twitch.tv/docs/api/reference/#get-all-stream-tags for details
public struct AllStreamTagRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        after: String? = nil,
        first: String? = nil,
        tagIDs: [String]? = nil
    ) {
        var queryItems = [
            "after": after as Any,
            "first": first as Any].buildQueryItems()
        if let nonNullIds = tagIDs {
            for id in nonNullIds {
                queryItems.append(URLQueryItem(name: "tag_id", value: id))
            }
        }
        
        self.url = TwitchEndpoints.allStreamTags.construct()?.appending(queryItems: queryItems)
    }
}

