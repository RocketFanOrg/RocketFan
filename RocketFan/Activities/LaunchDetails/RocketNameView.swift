//
//  RocketNameView.swift
//  RocketFan
//
//  Created by Robert Clegg on 2021/06/25.
//

import SwiftUI

struct RocketNameView: View {
    let name: String

    var body: some View {
        Text("🚀 \(name)")
            .padding(8)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(.primary)
            )
    }
}

struct RocketNameView_Previews: PreviewProvider {
    static var previews: some View {
        RocketNameView(name: "Falcon")
    }
}
