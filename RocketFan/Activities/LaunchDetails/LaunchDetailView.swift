//
//  LaunchDetailView.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/06/25.
//

import SwiftUI

struct LaunchDetailView: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .task {
                    viewModel.loadLaunchDetails()
                }
        } else {
            ScrollView {
                AsyncImage(url: viewModel.launchSmallPatchURL)
                HStack {
                    LaunchStatusView(launchSuccess: viewModel.launchSuccess,
                                     isUpcoming: viewModel.isUpcoming)
                    RocketNameView(name: viewModel.rocketName)
                        .padding()
                }
                .padding([.top, .bottom], 8)


                Text(viewModel.launchDescription)
            }
            .padding()
            .navigationTitle(viewModel.missionName)
        }
    }

    init(launch: Launch) {
        _viewModel = StateObject(wrappedValue: ViewModel(launch: launch))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailView(launch: Launch.example)
    }
}
