//
//  StreamModelTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import XCTest

@testable import TwitchAPIWrapper

class StreamModelTests: XCTestCase {
    func testBuildStreamModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let wrapper = try decoder.decode(StreamWrapper.self, from: Fixtures.dataFromFixtureFile("Game"))
            let stream = wrapper.streams[0]
            let pagination = wrapper.pagination
            let date = Date.twitchStandardDateFormatter.date(from: "2017-08-14T15:45:17Z")
            XCTAssertEqual(stream.communityIds, [
                "848d95be-90b3-44a5-b143-6e373754c382",
                "fd0eab99-832a-4d7e-8cc0-04d73deb2e54",
                "ff1e77af-551d-4993-945c-f8ceaa2a2829"
                ])
            XCTAssertEqual(stream.gameId, "29307")
            XCTAssertEqual(stream.id, "26007351216")
            XCTAssertEqual(stream.language, "en")
            XCTAssertEqual(stream.startedAt, date)
            XCTAssertEqual(stream.thumbnailURL, URL(string: "https://static-cdn.jtvnw.net/previews-ttv/live_user_dansgaming-{width}x{height}.jpg"))
            XCTAssertEqual(stream.title, "[Punday Monday] Necromancer - Dan's First Character - Maps - !build")
            XCTAssertEqual(stream.type, StreamType.live)
            XCTAssertEqual(stream.userId, "26007351216")
            XCTAssertEqual(stream.viewCount, 5723)
            XCTAssertEqual(pagination.cursor, "eyJiIjp7Ik9mZnNldCI6MH0sImEiOnsiT2Zmc2V0Ijo0MH19")
        } catch {
            print(error)
        }
    }
}



