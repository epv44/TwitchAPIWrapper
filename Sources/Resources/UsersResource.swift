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
    typealias Model = User
    
    //MARK: - JSONResource
    func model(from jsonDictionary: JSONDictionaryType) -> Model? {
        return User(json: jsonDictionary)
    }
}
