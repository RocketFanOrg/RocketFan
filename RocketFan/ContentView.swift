import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LaunchesView(filter: .future)
                .tabItem {
                    Text("Upcoming")
                    Image(systemName: "calendar.badge.clock")
                }

            LaunchesView(filter: .past)
                .tabItem {
                    Text("Past")
                    Image(systemName: "clock.arrow.circlepath")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
