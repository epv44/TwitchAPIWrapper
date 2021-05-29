//
//  Fixtures.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/28/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
@testable import TwitchAPIWrapper

enum FixtureError: Error {
    case resourceNotFound
    case unparseableJSON
}

class Fixtures {
    class func dataFromFixtureFile(_ basename: String) throws -> Data {
        let ext = "json"
        guard let url = Bundle(for: self).url(forResource: basename, withExtension: ext) else {
            throw FixtureError.resourceNotFound
        }
        return try Data(contentsOf: url)
    }
    
    class func jsonFromFixtureFile(_ basename: String) throws -> [String:Any] {
        let data = try dataFromFixtureFile(basename)
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {
            throw FixtureError.unparseableJSON
        }
        return json
    }
}
