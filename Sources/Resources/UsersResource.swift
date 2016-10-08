//
//  UsersService.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

protocol NetworkJSONRequestType: SendableJSONRequest, JSONResource {}

struct UsersResource: NetworkJSONRequestType {
    typealias Resource = [User]
    typealias Model = [User]
    
    //MARK: - JSONResource
    func model(from jsonDictionary: JSONDictionaryType) -> [User]? {
        guard let users: [JSONDictionaryType] = jsonDictionary["users"] as? [JSONDictionaryType] else {
            return []
        }
        return users.flatMap(User.init)
    }
}
