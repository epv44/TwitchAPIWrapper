//
//  UserPresenter.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

//Make sample app, call presenter which will check keychain for client-id if no client id then get it

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
    func set(users: User?)
    /**
     `Error` returned from the network.
     - parameter error: The error returned from the network.
    */
    func handle(error: Error)
}

///A user presenter presents a User from the network to the front end of the application
public class UserPresenter: JSONConstructableRequest {
    private weak var dataSource: UserPresenterDataSource?
    var url: URL?
    var headers: [String: String]
    
    /**
     Initialize a new `UserPresenter`
     - parameter dataSource: `DataSource` that contains methods updating the state of the front end
    */
    public init(dataSource: UserPresenterDataSource) {
        self.dataSource = dataSource
        url = URL(string: Constants.network.userPath)
        //will need to get client id from oauth response
        headers = ["Client-ID": "akdjfkj"]
    }
    
    /**
     
    */
    public func get(path: String) {
        let usersResource = UsersResource()
        usersResource.send(request: buildRequest(),completion: { [weak self] (result) in
            switch result {
            case let .failure(error):
                self?.dataSource?.handle(error: error)
            case let .success(users):
                self?.dataSource?.set(users: users)
                self?.dataSource?.finishLoading()
            }
        })
    }
}
