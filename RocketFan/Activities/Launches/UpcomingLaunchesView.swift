//
//  UpcomingLaunchesView.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/02/15.
//

import SwiftUI

struct UpcomingLaunchesView: View {
    @StateObject var viewModel: ViewModel
    
    static let launchDateFormater: DateFormatter = {
         DateFormatter()
    }()
    
    var body: some View {
        NavigationView {
            List {
                if let nextLaunch = viewModel.nextLaunch {
                    Section(header: Text("Next")) {
                        LaunchRow(launch: nextLaunch, dateFormatter: Self.launchDateFormater)
                    }
                }
                
                Section(header: Text("Later")) {
                    ForEach(viewModel.upCominglaunches, id: \.id) { launch in
                        NavigationLink(destination: Text(launch.name)) {
                            LaunchRow(launch: launch, dateFormatter: Self.launchDateFormater)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Upcoming")
            .onAppear(perform: viewModel.loadLaunchData)
        }
    }
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
}

struct UpcomingLaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingLaunchesView()
    }
}
