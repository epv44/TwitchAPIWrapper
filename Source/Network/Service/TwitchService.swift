//
//  NetworkManager.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/2/18.
//

import Foundation

final public class TwitchService {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    public func user(userResource: UserResource, completion: @escaping ((Result<User>) -> Void)) {
        networkManager.send(request: userResource.buildRequest(), withResponseBodyType: UserWrapper.self) { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(wrapper):
                completion(.success(wrapper.users[0]))
            }
        }
    }
}
