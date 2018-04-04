//
//  URLExtension.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/31/18.
//

import Foundation

extension URL {
    func appending(queryItems: [URLQueryItem]) -> URL? {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let originalQueryItems = urlComponents?.queryItems ?? []
        urlComponents?.queryItems = originalQueryItems + queryItems
        
        return urlComponents?.url
    }
}
