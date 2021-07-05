//
//  LaunchStatusView.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/06/23.
//

import SwiftUI

struct LaunchStatusView: View {
    let launchSuccess: Bool
    let isUpcoming: Bool

    private var status: String {
        if isUpcoming {
            return "Upcoming"
        } else {
            return launchSuccess ? "Success" : "Failed"
        }
    }

    private var statusColor: Color {
        if isUpcoming {
            return .orange
        } else {
            return launchSuccess ? .green : .red
        }
    }

    var body: some View {
        Text(status)
            .foregroundColor(statusColor)
            .padding(8)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(statusColor)
            )
    }
}

struct LaunchStatusView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchStatusView(launchSuccess: false, isUpcoming: false)
    }
}
