import XCTest
import TwitchAPIWrapper

class VideoRequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBuildVideoRequest_withRequiredParams() {
        let request = try! VideoRequest(id: ["1"], userID: "abc123", gameID: "tfm")
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/helix/videos")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/videos?id=1&game_id=tfm&user_id=abc123")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildVideoRequest_withEverything() {
        let request = try! VideoRequest(id: ["1"], userID: "abc123", gameID: "tfm", after: "10-23-92", before: "march", first: "7", language: ["en"], period: "april", sort: "no", type: "all")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/videos?id=1&game_id=tfm&after=10-23-92&sort=no&language=en&user_id=abc123&period=april&before=march&first=7&type=all")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
