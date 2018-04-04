//
//  GameRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

public struct GameRequest: JSONConstructableRequest {
    var url: URL?
    let headers: [String : String]
    
    init(id: [String], name: [String]) {
        var idItems = id.map { URLQueryItem(name: "id", value: $0) }
        let nameItems = name.map { URLQueryItem(name: "id", value: $0) }

        idItems.append(contentsOf: nameItems)
        self.url = TwitchEndpoints.games.construct()?.appending(queryItems: idItems)
        guard let clientId = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Authorization": clientId]
    }
}

