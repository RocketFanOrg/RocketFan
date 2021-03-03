//
//  UpcomingLaunchesViewModel.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/03/03.
//

import Foundation
import Combine

extension UpcomingLaunchesView {
    final class ViewModel: ObservableObject {
        private lazy var repo = UpcomingLaunchesRepo()
        private var nextLaunchId = ""
        
        @Published var upCominglaunches = [Launch]()
        @Published var nextLaunch: Launch?
        
        /// Loads the next launch as well as all launches
        func loadLaunchData() {
            loadNextLaunch()
        }
        
        /// Loads all upcoming launches
        private func loadUpcomingLaunches() {
            repo.fetchUpcomingLaunches { result in
                do {
                    var upcomingLaunches = try result.get()
                    DispatchQueue.main.async {
                        self.nextLaunch = upcomingLaunches.first(where: { $0.id == self.nextLaunchId })
                        
                        //No need to include next launch in upcomingLaunches - as we already show next launch on screen
                        upcomingLaunches.removeAll(where: {$0.id == self.nextLaunchId})
                        self.upCominglaunches = upcomingLaunches
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        /// Loads the next upcoming launch
        private func loadNextLaunch() {
            repo.fetchNextLaunch { result in
                do {
                    let launch = try result.get()
                    self.nextLaunchId = launch.id
                    self.loadUpcomingLaunches()

                } catch {
                    print(error)
                }
            }
        }
    }
}
