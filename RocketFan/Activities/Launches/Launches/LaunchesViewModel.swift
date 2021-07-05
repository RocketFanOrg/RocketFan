import Foundation
import Combine

extension LaunchesView {
    final class ViewModel: ObservableObject {
        enum Filter {
            case past
            case future
        }

        @Published var launches = [Launch]()
        @Published var featuredLaunch: Launch?

        private lazy var repo = LaunchesRepo()
        private let filter: Filter

        init(filter: Filter) {
            self.filter = filter
        }

        /// Loads the next launch as well as all launches
        func loadLaunchData() {
            if filter == .future {
                loadUpcomingLaunches()
            } else {
                loadPastLaunchesData()
            }
        }
        
        /// Loads all upcoming launches
        private func loadUpcomingLaunches() {
            guard launches.isEmpty else { return }

            repo.fetchUpcomingLaunches { result in
                do {
                    var upcomingLaunches = try result.get().sorted(by: { $0.launchDate ?? .now < $1.launchDate ?? .now })
                    DispatchQueue.main.async {
                        self.featuredLaunch = upcomingLaunches.max(by: {$0.launchDate ?? .now > $1.launchDate ?? .now })
                        self.remove(launchId: self.featuredLaunch?.id, from: &upcomingLaunches)
                        self.launches = upcomingLaunches
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

        /// Loads all past launches
        private func loadPastLaunchesData() {
            guard launches.isEmpty else { return }

            repo.pastLaunches { result in
                do {
                    var pastLaunches =  try result.get().sorted(by: { $0.launchDate ?? .now > $1.launchDate ?? .now })
                    DispatchQueue.main.async {
                        self.featuredLaunch = pastLaunches.max(by: {$0.launchDate ?? .now < $1.launchDate ?? .now })
                        self.remove(launchId: self.featuredLaunch?.id, from: &pastLaunches)
                        self.launches = pastLaunches
                    }
                } catch {
                    print(error)
                }
            }
        }

        private func remove(launchId: String?, from launches: inout [Launch]) {
            launches.removeAll(where: {$0.id == launchId})
        }
    }
}
