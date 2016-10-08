//
//  ConstructableRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

public protocol ResourceType {
    associatedtype Model
}

public enum Result<T> {
    case success(T)
    case failure(Error)
}

public enum ParsingError: Error {
    case invalidJSONData
    case cannotParseJSONDictionary
    case cannotParseJSONArray
    case unsupportedType
}

public enum NetworkJSONServiceError: Error {
    case networkError(error: Error)
    case noData
}

protocol ConstructableRequest: RestRequest {
    func buildRequest() -> URLRequest?
}

protocol JSONConstructableRequest: ConstructableRequest {}
protocol SendableJSONRequest: JSONResource {
    associatedtype Model
}

extension JSONConstructableRequest {
    func buildRequest() -> URLRequest? {
        let request = NSMutableURLRequest(url: url!)
        request.allHTTPHeaderFields = headers
        if method != "GET" {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        request.httpMethod = method
        return request as URLRequest
    }
}

extension SendableJSONRequest {
    func send(request: URLRequest?, completion: @escaping (_ result: Result<Model>) -> ()) {
        let session = URLSession.shared
        guard let request = request else { return }
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(NetworkJSONServiceError.networkError(error: error)))
            }
            
            guard let data = data else {
                completion(.failure(NetworkJSONServiceError.noData))
                return
            }
            
            completion(self.result(from: data))
        })
        task.resume()
    }
}
