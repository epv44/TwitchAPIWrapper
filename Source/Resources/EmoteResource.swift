//
//  EmoteResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import Foundation

struct EmoteResource: NetworkJSONRequestType {
    typealias Model = [Emote]
    
    //MARK: - JSONResource From Dictionary
    func model(from jsonDictionary: JSONDictionaryType) -> Model? {
        var emotesArray: [Emote] = [Emote]()
        if let emoticonSet = jsonDictionary["emoticon_sets"] as? [String: Any] {
            for (_, value) in emoticonSet {
                guard let jsonArray = value as? JSONArrayType else {
                    NSLog("error with json value: \(value)" )
                    continue
                }
                guard let emoteValues: [Emote] = model(from: jsonArray) else {
                    NSLog("error with json from array")
                    continue
                }
                emotesArray.append(contentsOf: emoteValues)
            }
        }
        return emotesArray
    }
    
    //MARK: - JSONResource From Array
    func model(from jsonArray: JSONArrayType) -> Model? {
        guard let arrValue = jsonArray as? [JSONDictionaryType] else {
            return nil
        }
        return arrValue.flatMap { Emote(json: $0) }
    }
}
