//
//  UsersService.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

protocol NetworkJSONRequestType: RestRequest, JSONConstructableRequest, SendableJSONRequest, JSONResource {}

struct UsersResource: NetworkJSONRequestType {
    typealias Model = [User]
    var url: URL
    var baseUrl: URL?
    var pathh: String    
    
    init(path: String) {
        url = URL(string: Constants.network.baseURL + path)!
        pathh = ""
        baseUrl = URL(string: "www.google.com")
    }
    
    //MARK: - JSONResource
    func model(from jsonDictionary: JSONDictionaryType) -> [User]? {
        guard let users: [JSONDictionaryType] = jsonDictionary["users"] as? [JSONDictionaryType] else {
            return []
        }
        return users.flatMap(User.init)
    }
}
