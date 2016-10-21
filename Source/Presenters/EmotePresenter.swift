//
//  EmotePresenter.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/21/16.
//
//

import Foundation

public class EmotePresenter: JSONConstructableRequest {
    var url: URL?
    var headers: [String: String]
    var urlComponents: URLComponents?
    private weak var dataSource: TwitchAPIDataSource?
    
    /**
     Initialize a new `EmotePresenter`.
     
     - parameter dataSource: `DataSource` that contains methods updating the state of the front end.
     */
    public init(dataSource: TwitchAPIDataSource) {
        self.dataSource = dataSource
        self.urlComponents = URLComponents()
        self.urlComponents?.scheme = Constants.network.userComponents.scheme
        self.urlComponents?.host = Constants.network.userComponents.host
        guard let clientId = TwitchAuthorizationManager.sharedInstance.clientID else {
            NSLog("Must specify client_id to make rest request")
            headers = [:]
            return
        }
        headers = ["client-id": clientId]
    }
    
    /**
     Initialize a new list of Emote resources for a User from the network.
     
     - throws `PresentationError`.
     */
    public func getUsersEmoticons(for username: String) throws {
        urlComponents?.path = Constants.network.userComponents.usersPath + username + "/emotes"
        url = urlComponents?.url
        NSLog("\(url)")
        guard let token = TwitchAuthorizationManager.sharedInstance.authToken else {
            throw PresentationError.noAuthorizationToken(desc: "Authorization token is missing ensure that you first authenticate (future versions of this sdk will auto-authenticate in this instance")
        }
        headers["Authorization"] = "OAuth " + token
        requestResource()
    }
    
    private func requestResource() {
        dataSource?.startLoading(for: .emote)
        let emoteResource = EmoteResource()
        emoteResource.send(request: buildRequest(),completion: { [weak self] (result) in
            self?.dataSource?.finishLoading(for: .emote)
            switch result {
            case let .failure(error):
                self?.dataSource?.handle(error: error)
            case let .success(resource):
                self?.dataSource?.set(resource: resource)
            }
        })
    }
}
