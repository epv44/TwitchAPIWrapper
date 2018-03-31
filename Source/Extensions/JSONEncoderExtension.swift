//
//  JSONEncoderExtension.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/31/18.
//

import Foundation

extension JSONEncoder {
    class func twitchAPIStandard() -> JSONEncoder {
        let decoder = JSONEncoder()
        decoder.dateEncodingStrategy = .formatted(Date.twitchStandardDateFormatter)
        
        return decoder
    }
}
