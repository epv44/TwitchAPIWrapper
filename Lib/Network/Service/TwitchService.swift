//
//  NetworkManager.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/2/18.
//

import Foundation

final public class TwitchService {
    private let networkManager: TwitchNetworkManagerService
    
    public init() {
        self.networkManager = TwitchNetworkManager()
    }
    
    init(networkManager: TwitchNetworkManagerService = TwitchNetworkManager()) {
        self.networkManager = networkManager
    }

    public func clips(forRequest clipRequest: ClipRequest, completion: @escaping ((Result<[Clip]>) -> Void)) {
        networkManager.send(request: clipRequest.buildRequest(), withResponseBodyType: ClipWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.clips))
            }
        }
    }
    
    public func games(forRequest gameRequest: GameRequest, completion: @escaping ((Result<[Game]>) -> Void)) {
        networkManager.send(request: gameRequest.buildRequest(), withResponseBodyType: GameWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.games))
            }
        }
    }
    
    public func gameAnalytics(forRequest gameAnalyticsRequest: GameAnalyticsRequest, completion: @escaping ((Result<[GameAnalytic]>) -> Void)) {
        networkManager.send(request: gameAnalyticsRequest.buildRequest(), withResponseBodyType: GameAnalyticsWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.gameAnalytics))
            }
        }
    }
    
    public func leaderboard(forRequest leaderboardRequest: LeaderboardRequest, completion: @escaping ((Result<Leaderboard>) -> Void)) {
        networkManager.send(request: leaderboardRequest.buildRequest(), withResponseBodyType: Leaderboard.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(value): completion(.success(value))
            }
        }
    }
    
    public func streams(forRequest streamRequest: StreamRequest, completion: @escaping ((Result<[Stream]>) -> Void)) {
        networkManager.send(request: streamRequest.buildRequest(), withResponseBodyType: StreamWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.streams))
            }
        }
    }
    
    public func streamMetadata(forRequest streamMetadataRequest: StreamMetadataRequest, completion: @escaping ((Result<StreamMetadata>) -> Void)) {
        networkManager.send(request: streamMetadataRequest.buildRequest(), withResponseBodyType: StreamMetadata.self) { result in
            completion(result)
        }
    }
    
    public func topGames(forRequest topGamesRequest: TopGameRequest, completion: @escaping ((Result<[Game]>) -> Void)) {
        networkManager.send(request: topGamesRequest.buildRequest(), withResponseBodyType: GameWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.games))
            }
        }
    }
    
    public func users(forRequest userRequest: UserRequest, completion: @escaping ((Result<[User]>) -> Void)) {
        networkManager.send(request: userRequest.buildRequest(), withResponseBodyType: UserWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.users))
            }
        }
    }
    
    public func updateUser(forRequest userRequest: UserUpdateRequest, completion: @escaping ((Result<User>) -> Void)) {
        networkManager.send(request: userRequest.buildRequest(), withResponseBodyType: UserWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.users[0]))
            }
        }
    }
    
    public func userFollows(forRequest userRequest: UserFollowRequest, completion: @escaping ((Result<UserFollow>) -> Void)) {
        networkManager.send(request: userRequest.buildRequest(), withResponseBodyType: UserFollow.self) { result in
            completion(result)
        }
    }
    
    public func videos(forRequest videoRequest: VideoRequest, completion: @escaping ((Result<[Video]>) -> Void)) {
        networkManager.send(request: videoRequest.buildRequest(), withResponseBodyType: VideoWrapper.self) { result in
            switch result {
            case let .failure(error): completion(.failure(error))
            case let .success(wrapper): completion(.success(wrapper.videos))
            }
        }
    }
}
