//
//  ConstructableRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

///Result of a network request.
public enum Result<T> {
    /**
     Successful network request and parsing into a Model.
     
     - parameter T: Generic model object that is returned as the result of a succesful network request.
    */
    case success(T)
    /**
     Unsuccessful network request resulting in an `Error`.
     
     - parameter Error: an `Error` describing the reason for an unsuccessful request.
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
     Specifies an error occurred while sending the network request.
     
     - parameter error: The error return from the `URLRequest`.
    */
    case networkError(error: Error)
    /**
     Specifies that no data was returned by the `URLRequest`.
    */
    case noData
    /**
     Specifies that the network status code was invalid (not between 200 and 400).
     
     - parameter response: `HTTPURLResponse` returned from the URLResponse.
    */
    case networkResponseError(response: HTTPURLResponse)
    /** 
     Specifies that an unknown error has occurred.
     
     - parameter desc: Description of where the error occurred.
     */
    case unknownErrorOccurred(desc: String)
}

public enum HTTPMethod: String {
    case get, post, put
}

protocol ConstructableRequest: RestRequest {
    func buildRequest() -> URLRequest?
}

protocol JSONConstructableRequest: ConstructableRequest {}

extension JSONConstructableRequest {
    public func buildRequest() -> URLRequest? {
        let request = NSMutableURLRequest(url: url!)
        request.allHTTPHeaderFields = headers
        if method == .post || method == .put {
            request.httpBody = data
        }
        request.httpMethod = method.rawValue
        
        return request as URLRequest
    }
}
