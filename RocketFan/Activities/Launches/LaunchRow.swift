import SwiftUI
import Kingfisher

struct LaunchRow: View {
    let launch: Launch
    var isNextLaunch = false

    private var formattedLaunchDate: String {
        guard let launchDate = launch.launchDate, isNextLaunch else {
            return launch.formattedLaunchDate
        }

        return launchDate.formatted(.relative(presentation: .named, unitsStyle: .wide))
    }

    var body: some View {
        VStack {
            HStack {
                if let patch = launch.smallPatchURL {
                KFImage(patch)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .padding(.trailing)
                } else {
                    Circle()
                        .fill()
                        .foregroundColor(.secondary)
                        .frame(width: 60, height: 60)
                        .padding(.trailing)
                }
                
                VStack(alignment: .leading) {
                    Text(launch.name)
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(.top)
                    Text(formattedLaunchDate)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct LaunchRow_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRow(launch: .example, isNextLaunch: true)
            .previewLayout(.fixed(width: 470, height: 150))
    }
}
