//
//  JSONDecoderExtension.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/31/18.
//

import Foundation

extension JSONDecoder {
    class func twitchAPIStandard() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return decoder
    }
}
