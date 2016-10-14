//
//  ConstructableRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

/**
 An instance conforming to the `ResourceType` protocol represents a resource with a specific type that the network response will be mapped to.
 */
public protocol ResourceType {
    ///The type of the item.
    associatedtype Model
}

///Result of a network request.
public enum Result<T> {
    /**
     Successful network request and parsing into a Model.
     - parameter: T: Generic model object that is returned as the result of a succesful network request.
    */
    case success(T)
    /**
     Unsuccessful network request resulting in an `Error`.
     - parameter: an `Error` describing the reason for an unsuccessful request.
    */
    case failure(Error)
}

///Error for parsing URL Requests.
public enum ParsingError: Error {
    /**
     Specifies that the JSON Data returned is invalid.
     */
    case invalidJSONData
    /**
     Specifies that the JSON Data could not be parsed as a Dictionary.
    */
    case cannotParseJSONDictionary
    /**
     Specifies that the JSON Data could not be parsed as an Array.
    */
    case cannotParseJSONArray
    /**
     Specifies that the response type is unsupported.
    */
    case unsupportedType
}

///Error in the network layer.
public enum NetworkJSONServiceError: Error {
    /**
     Specifies an error occured while sending the network request.
     - parameter: error: The error return from the `URLRequest`.
    */
    case networkError(error: Error)
    /**
     Specifies that no data was returned by the `URLRequest`
    */
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
        if method == "POST" {
            request.httpBody = data
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
