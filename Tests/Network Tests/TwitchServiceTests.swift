//
//  TwitchServiceTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/11/18.
//

import XCTest
@testable import TwitchAPIWrapper

class TwitchServiceTests: XCTestCase {
    func testClipsRequest() {
        let networkManger = MockTwitchNetworkManager<Clip>()
        let subject = TwitchService(networkManager: networkManger)
        let request = ClipRequest()
        subject.clips(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testGamesRequest() {
        let networkManger = MockTwitchNetworkManager<Game>()
        let subject = TwitchService(networkManager: networkManger)
        let request = GameRequest(id: ["123"], name: ["bob"])
        subject.games(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testGameAnalyticsRequest() {
        let networkManger = MockTwitchNetworkManager<GameAnalytic>()
        let subject = TwitchService(networkManager: networkManger)
        let request = GameAnalyticsRequest()
        subject.gameAnalytics(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testLeaderboardRequest() {
        let networkManger = MockTwitchNetworkManager<Leaderboard>()
        let subject = TwitchService(networkManager: networkManger)
        let request = LeaderboardRequest()
        subject.leaderboard(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testStreamsRequest() {
        let networkManger = MockTwitchNetworkManager<StreamWrapper>()
        let subject = TwitchService(networkManager: networkManger)
        let request = StreamRequest()
        subject.streams(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testStreamMetadataRequest() {
        let networkManger = MockTwitchNetworkManager<StreamMetadata>()
        let subject = TwitchService(networkManager: networkManger)
        let request = StreamMetadataRequest()
        subject.streamMetadata(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testTopGamesRequest() {
        let networkManger = MockTwitchNetworkManager<StreamMetadata>()
        let subject = TwitchService(networkManager: networkManger)
        let request = TopGameRequest()
        subject.topGames(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testUsersRequest() {
        let networkManger = MockTwitchNetworkManager<User>()
        let subject = TwitchService(networkManager: networkManger)
        let request = UserRequest()
        subject.users(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testUpdateUserRequest() {
        let networkManger = MockTwitchNetworkManager<User>()
        let subject = TwitchService(networkManager: networkManger)
        let request = UserUpdateRequest(description: "geazy")
        subject.updateUser(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testUserFollowsRequest() {
        let networkManger = MockTwitchNetworkManager<UserFollow>()
        let subject = TwitchService(networkManager: networkManger)
        let request = UserFollowRequest()
        subject.userFollows(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
    
    func testVideosRequest() {
        let networkManger = MockTwitchNetworkManager<Video>()
        let subject = TwitchService(networkManager: networkManger)
        let request = VideoRequest(id: ["123"], userId: "Colson Baker", gameId: "123")
        subject.videos(forRequest: request) { result in
            
        }
        XCTAssertEqual(networkManger.send_wasCalled_urlRequest, request.buildRequest())
    }
}
