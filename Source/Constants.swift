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
            static let usersPath = "/kraken/users/"
        }
        static let baseURL = "https://api.twitch.tv/kraken"
        static let userPath = baseURL + "/users"
        static let oauthTokenURL = baseURL + "/oauth2/token"
    }
}
