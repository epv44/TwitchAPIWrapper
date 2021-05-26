//
//  MockTwitchNetworkManager.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/11/18.
//

@testable import TwitchAPIWrapper

class MockTwitchNetworkManager<T: Decodable>: TwitchNetworkManagerService {
    var send_wasCalled_urlRequest: URLRequest?
    var stubbedCompletion: Result<T>!
    func send<T>(request: URLRequest?, withResponseBodyType responseBodyType: T.Type, completion: @escaping (Result<T>) -> ()) where T : Decodable {
        send_wasCalled_urlRequest = request
        completion(stubbedCompletion as? Result<T> ?? Result.failure(NSError()))
    }
    
    func send<T, TT>(request: URLRequest?, withResponseBodyType responseBodyType: T.Type, completion: @escaping (Result<TT>) -> ()) where TT : Decodable {
        send_wasCalled_urlRequest = request
        completion(stubbedCompletion as? Result<TT> ?? Result.failure(NSError()))
    }
}
