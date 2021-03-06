import Foundation
import SpaceXAPI

final class LaunchesRepo {
    private lazy var api = SpaceXAPI()
    
    /// Fetches all past and future launches
    /// - Parameter completion: Completion handler for when the API returns
    func fetchAllLaunches(completion: @escaping (Result<[Launch], Error>) -> Void) {
        api.get(endpoint: .allLaunches, completion: completion)
    }
    
    /// Fetches the next launch
    /// - Parameter completion: Completion handler for when the API returns
    func fetchNextLaunch(completion: @escaping (Result<Launch, Error>) -> Void) {
        api.get(endpoint: .nextLaunches, completion: completion)
    }
    
    /// Fetches upcoming launches
    /// - Parameter completion: Completion handler for when the API returns
    func fetchUpcomingLaunches(completion: @escaping (Result<[Launch], Error>) -> Void) {
        api.get(endpoint: .upcomingLaunches, completion: completion)
    }

    /// Fetches past launches
    /// - Parameter completion: Completion handler for when the API returns
    func pastLaunches(completion: @escaping (Result<[Launch], Error>) -> Void) {
        api.get(endpoint: .pastLaunches, completion: completion)
    }
}
