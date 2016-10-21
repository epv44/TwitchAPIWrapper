//
//  UserPresenter.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

///A `UserPresenter` presents a `User` from the network to the front end of the application.
public class UserPresenter: JSONConstructableRequest {
    var url: URL?
    var headers: [String: String]
    var urlComponents: URLComponents?
    private weak var dataSource: TwitchAPIDataSource?
    
    /**
     Initialize a new `UserPresenter`.
     
     - parameter dataSource: `DataSource` that contains methods for updating the state of the front end.
    */
    public init(dataSource: TwitchAPIDataSource) {
        self.dataSource = dataSource
        self.urlComponents = URLComponents()
        self.urlComponents?.scheme = Constants.network.userComponents.scheme
        self.urlComponents?.host = Constants.network.userComponents.host
        guard let clientId = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        headers = ["client-id": clientId]
    }
    
    /**
     Initialize a new User Resource from the network that corresponds to the current user.
     
     - throws `PresentationError`.
     */
    public func getCurrentUser() throws {
        urlComponents?.path = "/kraken/user"
        url = urlComponents?.url
        guard let token = TwitchAuthorizationManager.sharedInstance.authToken else {
            throw PresentationError.noAuthorizationToken(desc: "Authorization token is missing ensure that you first authenticate (future versions of this sdk will auto-authenticate in this instance")
        }
        headers["Authorization"] = "OAuth " + token
        requestResource()
    }
    
    /**
     Get the resource from network.
     
     - parameter path: Network path to the resource.
    */
    public func get(user path: String) {
        urlComponents?.path = Constants.network.userComponents.usersPath + path
        url = urlComponents?.url
        requestResource()
    }
    
    private func requestResource() {
        dataSource?.startLoading(for: .user)
        let usersResource = UsersResource()
        usersResource.send(request: buildRequest(),completion: { [weak self] (result) in
            self?.dataSource?.finishLoading(for: .user)
            switch result {
            case let .failure(error):
                self?.dataSource?.handle(error: error)
            case let .success(user):
                self?.dataSource?.set(resource: user)
            }
        })
    }
}
