import XCTest
@testable import RocketFan

class DevelopmentDataTests: XCTestCase {
    func testThatAllLaunchesLoadCorrectly() {
        XCTAssertEqual(Launch.allLaunches.count, 132)
        XCTAssertEqual(Launch.example.id, "5eb87ce1ffd86e000604b334")
    }
}
