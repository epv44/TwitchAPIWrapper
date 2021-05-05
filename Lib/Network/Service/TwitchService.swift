//
//  NetworkManager.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/2/18.
//

import Foundation

/**
 The `TwitchService` is the client API for interfacing with the Twitch service
 see the https://dev.twitch.tv/docs/api/reference/ for refrence on the
 available endpoints
*/
final public class TwitchService {
    private let networkManager: TwitchNetworkManagerService
    
    public init() {
        self.networkManager = TwitchNetworkManager()
    }
    
    init(networkManager: TwitchNetworkManagerService = TwitchNetworkManager()) {
        self.networkManager = networkManager
    }
    
    /**
     Generic API method for getting a Twitch API result
     - Parameter request: `JSONConstructableRequest` representing the data necessary for quering the Twitch API for your endpoint
     - returns Completion wrapped `Result` object with success representing the specified response model
     */
    public func gen<T>(forRequest request: JSONConstructableRequest, completion: @escaping ((Result<T>) -> Void)) where T: Codable {
        networkManager.send(request: request.buildRequest(), withResponseBodyType: T.self) { result in
            completion(result)
        }
    }
}
