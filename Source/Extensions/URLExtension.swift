//
//  URLExtension.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/31/18.
//

import Foundation

extension URL {
    private func appending(queryItems: [URLQueryItem]) -> URL? {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let originalQueryItems = urlComponents?.queryItems ?? []
        let uniqueQueryItems = originalQueryItems.filter { !queryItems.map({ $0.name }).contains($0.name) } + queryItems
        urlComponents?.queryItems = uniqueQueryItems
        
        return urlComponents?.url
    }
}
