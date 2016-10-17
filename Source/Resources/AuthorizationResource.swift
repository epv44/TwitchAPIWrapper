//
//  AuthenticationResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/14/16.
//
//

import Foundation

struct AuthorizationResource: NetworkJSONRequestType, JSONResource, JSONConstructableRequest {
    typealias Model = Credentials
    let url: URL?
    let method: String = "POST"
    let data: Data
    
    init(data: Data, url: URL) {
        self.data = data
        self.url = url
    }
    
    func processAuthorization(completion: @escaping (_ result: Result<Model>) -> ()) {
        send(request: buildRequest(),completion: { (result) in
            completion(result)
        })
    }
    
    //MARK: - JSONResource From Dictionary
    func model(from jsonDictionary: JSONDictionaryType) -> Model? {
        return Credentials(json: jsonDictionary)
    }
}
