//
//  RocketsRepo.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/06/25.
//

import Foundation
import SpaceXAPI

final class RocketsRepo {
    private lazy var api = SpaceXAPI()

    /// Fetches a single rocket info from the SpaceXApi
    /// - Parameters:
    ///   - id: The ID of the rocket to fetch data for
    ///   - completion: Completion handler for when the API returns
    func rocket(id: String, completion: @escaping (Result<Rocket, Error>) -> Void) {
        api.get(endpoint: .rocket(withId: id), completion: completion)
    }
}
