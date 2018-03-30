//
//  UsersService.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

struct UsersResource: SendableJSONRequest {
    typealias Model = User
    
    //MARK: - JSONResource From Dictionary
    func model(from jsonDictionary: JSONDictionaryType) -> Model? {
        return User(json: jsonDictionary)
    }
}
