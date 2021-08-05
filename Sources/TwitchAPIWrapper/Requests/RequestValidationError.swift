//
//  RequestValidationError.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/2/21.
//

import Foundation

enum RequestValidationError: Error {
    case invalidInput(String)
}
