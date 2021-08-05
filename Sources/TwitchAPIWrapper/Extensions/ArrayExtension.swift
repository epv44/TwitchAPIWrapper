//
//  ArrayExtension.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/25/21.
//

import Foundation

extension Array where Element == String {
    func constructQueryItems(withKey key: String) -> [URLQueryItem] {
        var queryParams = [URLQueryItem]()
        for value in self {
            queryParams.append(URLQueryItem(name: key, value: value))
        }
        return queryParams
    }
}
