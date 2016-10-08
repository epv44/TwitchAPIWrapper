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
protocol SendableJSONRequest: ConstructableRequest, JSONResource {
    associatedtype Model
}

extension JSONConstructableRequest {
    func buildRequest() -> URLRequest? {
        guard let baseURL = baseUrl else { return nil }
        guard let URLComponents = NSURLComponents(url: baseURL as URL, resolvingAgainstBaseURL: true) else { return nil }
        URLComponents.path = (URLComponents.path ?? "") + pathh
        guard let URL = URLComponents.url else { return nil }
        let request = NSMutableURLRequest(url: URL)
        if method != "GET" {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        request.httpMethod = method
        return request as URLRequest
    }
}
//the request shouldn't be built inside of the send request it should be passed in
//
extension SendableJSONRequest {
    func sendRequest(completion: @escaping (_ result: Result<Model>) -> ()) {
        let session = URLSession.shared
        guard let request = buildRequest() else { return }
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
