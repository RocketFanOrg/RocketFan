import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      UpcomingLaunchesView()
        .tabItem {
          Text("Upcoming")
          Image(systemName: "calendar.badge.clock")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
