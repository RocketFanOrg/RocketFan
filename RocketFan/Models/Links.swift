import Foundation

struct Links : Codable {

    let article: String?
    let flickr: Flickr?
    let patch: Patch?
    let presskit: String?
    let reddit: Reddit?
    let webcast: String?
    let wikipedia: String?
    let youtubeId: String?

    enum CodingKeys: String, CodingKey {
        case article = "article"
        case flickr = "flickr"
        case patch = "patch"
        case presskit = "presskit"
        case reddit = "reddit"
        case webcast = "webcast"
        case wikipedia = "wikipedia"
        case youtubeId = "youtube_id"
    }
}

struct Reddit: Codable {
    let campaign: String?
    let launch: String?
    let media: String?
    let recovery: String?
}

struct Patch: Codable {
    let large: String?
    let small: String?
}

struct Flickr: Codable {
    let original: [String]?
    let small: [String]?
}
