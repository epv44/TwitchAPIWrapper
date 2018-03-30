//
//  EmoteResource.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import Foundation

struct EmoteResource: SendableJSONRequest {
    typealias Model = [Emote]
    
    //MARK: - JSONResource From Dictionary
    func model(from jsonDictionary: JSONDictionaryType) -> Model? {
        var emotesArray: [Emote] = [Emote]()
        if let emoticonSet = jsonDictionary["emoticon_sets"] as? [String: Any] {
            for (_, value) in emoticonSet {
                guard let jsonArray = value as? JSONArrayType else {
                    EVLog(text: "error with json value: \(value)", line: #line, fileName: #file)
                    continue
                }
                guard let emoteValues: [Emote] = model(from: jsonArray) else {
                    EVLog(text: "error with json from array", line: #line, fileName: #file)
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
        return nil //arrValue.flatMap { Emote(json: $0) }
    }
}
