//
//  UserPresenter.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

public protocol UserPresenterDataSource: class {
    func startLoading()
    func finishLoading()
    func set(users: [User]?)
    func handle(error: Error)
}

public class UserPresenter {
    private weak var dataSource: UserPresenterDataSource?
    //private let operationQueue = OperationQueue()
    
    init(dataSource: UserPresenterDataSource) {
        self.dataSource = dataSource
    }
    
    func get(path: String) {
        let usersResource = UsersResource(path: path)
        //construct request here and pass it into the send request method??
        usersResource.sendRequest(completion: { [weak self] (result) in
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
