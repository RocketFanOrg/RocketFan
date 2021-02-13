//
//  LaunchRow.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/02/13.
//

import SwiftUI

struct LaunchRow: View {
    let launch: Launch

    var body: some View {
        VStack {
            HStack {
                Image("example_patch")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding()

                VStack(alignment: .leading) {
                    Text(launch.name)
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(.top)
                    Text("October 6th 2020")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    if let details = launch.details {
                    Text(details)
                        .lineLimit(2)
                        .padding([.top, .bottom])
                    }
                }
            }
        }
    }
}

struct LaunchRow_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRow(launch: .example)
            .previewLayout(.fixed(width: 470, height: 150))
    }
}
