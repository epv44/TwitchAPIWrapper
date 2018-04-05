//
//  DictionaryExtension.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import Foundation

extension Dictionary where Key == String {
    func buildQueryItems() -> [URLQueryItem] {
        var queryParams = [URLQueryItem]()
        for (key, value) in self {
            if let value = value as? String {
                queryParams.append(URLQueryItem(name: key, value: value))
            }
            if let value = value as? [String] {
                queryParams.append(contentsOf: value.map { URLQueryItem(name: key, value: $0) })
            }
        }
        return queryParams
    }
}
