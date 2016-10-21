//
//  JSONResourceType.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

///Type for a network JSON resource in dictionary format: `[String: Any]`.
public typealias JSONDictionaryType = [String: Any]

///Type for a network JSON resource in Array format: `[AnyObject]`.
public typealias JSONArrayType = [Any]

///An instance conforming to `JSONResource` represents a network resource that is consumed in JSON format.
public protocol JSONResource: ResourceType {
    /**
     Constructs a new Model from a `JSONDictionaryType`.
     
     - parameter jsonDictionary: JSON blob from the network that conforms to `JSONDictionaryType`.
     
     - returns: A new model represented by the JSON blob.
    */
    func model(from jsonDictionary: JSONDictionaryType) -> Model?
    /**
     Constructs a new Model from a `JSONArrayType`.
     
     - parameter jsonArray: JSON blob from the network that conforms to `JSONArrayType`.
     
     - returns: A new model represented by the JSON blob.
    */
    func model(from jsonArray: JSONArrayType) -> Model?
}

extension JSONResource {
    public func model(from jsonDictionary: JSONDictionaryType) -> Model? { return nil }
    public func model(from jsonArray: JSONArrayType) -> Model? { return nil }
    
    func result(from data: Data) -> Result<Model> {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return .failure(ParsingError.invalidJSONData)
        }
        
        if let jsonDictionary = jsonObject as? JSONDictionaryType {
            return result(from: jsonDictionary)
        }
        
        if let jsonArray = jsonObject as? JSONArrayType {
            return result(from: jsonArray)
        }
        
        return .failure(ParsingError.unsupportedType)
    }
    
    private func result(from dict: JSONDictionaryType) -> Result<Model> {
        if let parsedResults = model(from: dict) {
            return .success(parsedResults)
        } else {
            return .failure(ParsingError.cannotParseJSONDictionary)
        }
    }
    
    private func result(from arr: JSONArrayType) -> Result<Model> {
        if let parsedResults = model(from: arr) {
            return .success(parsedResults)
        } else {
            return .failure(ParsingError.cannotParseJSONArray)
        }
    }
}
