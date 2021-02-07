import Foundation

struct Fairing : Codable {
    let lastUpdate : String?
    let launches : [String]?
    let netLanding : Int?
    let netLandingAttempts : Int?
    let reuseCount : Int?
    let serial : String?
    let status : String?
    let version : String?
    let waterLanding : Int?
    let waterLandingAttempts : Int?

    enum CodingKeys: String, CodingKey {
        case lastUpdate = "last_update"
        case launches = "launches"
        case netLanding = "net_landing"
        case netLandingAttempts = "net_landing_attempts"
        case reuseCount = "reuse_count"
        case serial = "serial"
        case status = "status"
        case version = "version"
        case waterLanding = "water_landing"
        case waterLandingAttempts = "water_landing_attempts"
    }
}
