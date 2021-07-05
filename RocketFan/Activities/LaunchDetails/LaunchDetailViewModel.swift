//
//  LaunchDetailViewModel.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/06/25.
//

import Foundation

extension LaunchDetailView {
    final class ViewModel: ObservableObject {
        private lazy var repo = RocketsRepo()
        private let launch: Launch

        @Published var isLoading = true
        @Published var rocket: Rocket?

        var launchDescription: String {
            launch.details ?? ""
        }

        var missionName: String {
            launch.name
        }

        var launchSmallPatchURL: URL? {
            launch.smallPatchURL
        }

        var launchSuccess: Bool {
            launch.success ?? false
        }

        var isUpcoming: Bool {
            launch.upcoming
        }

        var rocketName: String {
            rocket?.name ?? ""
        }

        init(launch: Launch) {
            self.launch = launch
        }

        @MainActor
        func loadLaunchDetails() {
            repo.rocket(id: launch.rocketId) { result in
                do {
                    let rocketData = try result.get()
                    DispatchQueue.main.async {
                        self.rocket = rocketData
                        self.isLoading = false
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
