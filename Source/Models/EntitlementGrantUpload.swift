//
//  EntitlementGrantUpload.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/11/18.
//

import Foundation

class EntitlementGrantUploadWrapper: Codable {
    let uploads: [EntitlementGrantUpload]
    
    private enum CodingKeys: String, CodingKey {
        case uploads = "data"
    }
}

public class EntitlementGrantUpload: Codable {
    let url: URL
}
