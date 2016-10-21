//
//  MockJSONResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import Foundation
@testable import TwitchAPIWrapper

class MockJSONResource: JSONResource {
    typealias Model = User
    //User the user model for testing purposes, the user model does not implement the array method thus it will return nil (as per default)
    public func model(from jsonDictionary: JSONDictionaryType) -> Model? {
        return User(json: jsonDictionary)
    }
}
