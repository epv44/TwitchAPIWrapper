//
//  Constants.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

struct Constants {
    struct network {
        struct userComponents {
            static let scheme = "https"
            static let host = "api.twitch.tv"
            static let authenticationHost = "id.twitch.tv"
        }
        static let baseURL = "https://api.twitch.tv/"
    }
}
