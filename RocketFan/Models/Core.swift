import Foundation

struct Core : Codable {

    let asdsAttempts : Int?
    let asdsLandings : Int?
    let block : Int?
    let id : String?
    let lastUpdate : String?
    let launches : [String]?
    let reuseCount : Int?
    let rtlsAttempts : Int?
    let rtlsLandings : Int?
    let serial : String?
    let status : String?

    enum CodingKeys: String, CodingKey {
        case asdsAttempts = "asds_attempts"
        case asdsLandings = "asds_landings"
        case block = "block"
        case id = "id"
        case lastUpdate = "last_update"
        case launches = "launches"
        case reuseCount = "reuse_count"
        case rtlsAttempts = "rtls_attempts"
        case rtlsLandings = "rtls_landings"
        case serial = "serial"
        case status = "status"
    }
}
