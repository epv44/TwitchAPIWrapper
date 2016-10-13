//
//  UserPresenter.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

//Make sample app, call presenter which will check keychain for client-id if no client id then get it

import Foundation

public protocol UserPresenterDataSource: class {
    func startLoading()
    func finishLoading()
    func set(users: User?)
    func handle(error: Error)
}

public class UserPresenter: JSONConstructableRequest {
    private weak var dataSource: UserPresenterDataSource?
    var url: URL?
    var headers: [String: String]
    
    public init(dataSource: UserPresenterDataSource) {
        self.dataSource = dataSource
        url = URL(string: Constants.network.userPath)
        //will need to get client id from oauth response
        headers = ["Client-ID": "akdjfkj"]
    }
    
    public func get(path: String) {
        let usersResource = UsersResource()
        usersResource.send(request: buildRequest(),completion: { [weak self] (result) in
            switch result {
            case let .failure(error):
                self?.dataSource?.handle(error: error)
            case let .success(users):
                self?.dataSource?.set(users: users)
                self?.dataSource?.finishLoading()
                break
            }
        })
    }
}
