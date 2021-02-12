import Foundation

struct Launch: Codable, Identifiable {
    let id: String
    let fairings: Fairings?
    let links: Links
    let staticFireDate: Date?
    let rocketId: String
    let success: Bool?
    let details: String?
    let crewIds: [String]
    let shipIds: [String]
    let capsuleIds: [String]
    let payloadIds: [String]
    let launchpadId: String
    let flightNumber: Int
    let name: String
    let launchDate: Date?
    let datePrecision: DatePrecision
    let upcoming: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case fairings
        case links
        case staticFireDate = "static_fire_date_unix"
        case rocketId = "rocket"
        case success
        case details
        case crewIds = "crew"
        case shipIds = "ships"
        case capsuleIds = "capsules"
        case payloadIds = "payloads"
        case flightNumber = "flight_number"
        case name
        case launchpadId = "launchpad"
        case launchDate = "date_unix"
        case datePrecision = "date_precision"
        case upcoming
    }
}

extension Launch {
    enum DatePrecision: String, Codable {
        case hour
        case half
        case day
        case month
        case quarter
    }

    struct Fairings: Codable {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String]

        enum CodingKeys: String, CodingKey {
            case reused
            case recoveryAttempt = "recovery_attempt"
            case recovered
            case ships
        }
    }

    struct Failure: Codable {
        let time: Int
        let altitude: Int?
        let reason: String
    }
}

// MARK: - Sample data
extension Launch {
    static let allLaunches: [Launch] = Bundle.main.decode([Launch].self, from: "AllLaunches.json")
    static let example = allLaunches[0]
}
