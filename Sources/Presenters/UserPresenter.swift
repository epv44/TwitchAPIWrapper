//
//  UserPresenter.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

///An instance conformming to `UserPresenterDataSource` represents a class that utilizes a `User`.
public protocol UserPresenterDataSource: class {
    ///Called when the loading process begins.
    func startLoading()
    ///Called when the loading process is completed.
    func finishLoading()
    /**
     `User` object returned.
     
     - parameter user: The `User` returned from the network.
    */
    func set(user: User?)
    /**
     `Error` returned from the network.
     
     - parameter error: The error returned from the network.
    */
    func handle(error: Error)
}



///A user presenter presents a User from the network to the front end of the application.
public class UserPresenter: JSONConstructableRequest {
    var url: URL?
    var headers: [String: String]
    var urlComponents: URLComponents?
    private weak var dataSource: UserPresenterDataSource?
    
    /**
     Initialize a new `UserPresenter`.
     
     - parameter dataSource: `DataSource` that contains methods updating the state of the front end.
    */
    public init(dataSource: UserPresenterDataSource) {
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
        dataSource?.startLoading()
        let usersResource = UsersResource()
        usersResource.send(request: buildRequest(),completion: { [weak self] (result) in
            self?.dataSource?.finishLoading()
            switch result {
            case let .failure(error):
                self?.dataSource?.handle(error: error)
            case let .success(users):
                self?.dataSource?.set(user: users)
            }
        })
    }
}
