//
//  EVLog.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import Foundation

func EVLog(text: String, line: Int, fileName: String) {
    #if DEBUG
        NSLog("\(text) line: \(line) fileName: \(fileName)")
    #endif
}
