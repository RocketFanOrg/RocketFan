import SwiftUI

struct LaunchesView: View {
    @StateObject var viewModel: ViewModel
    let filter: ViewModel.Filter

    private var secondHeaderText: String {
        guard viewModel.launches.isEmpty == false else { return "" }
        return filter == .future ? "Later" : "Past"
    }

    private var navigationBarTitle: String {
        filter == .future ? "Upcoming" : "Past"
    }

    var body: some View {
        NavigationView {
            List {
                if let nextLaunch = viewModel.featuredLaunch {
                    Section() {
                        NavigationLink(destination: LaunchDetailView(launch: nextLaunch)) {
                            LaunchRow(launch: nextLaunch, isNextLaunch: true)
                        }
                    }
                }

                Section(header: Text(secondHeaderText)) {
                    ForEach(viewModel.launches, id: \.id) { launch in
                        NavigationLink(destination: LaunchDetailView(launch: launch)) {
                            LaunchRow(launch: launch)
                        }
                    }
                }
            }
            .navigationBarTitle(navigationBarTitle)
            .task {
                viewModel.loadLaunchData()
            }
        }
    }
    
    init(filter: ViewModel.Filter) {
        self.filter = filter
        _viewModel = StateObject(wrappedValue: ViewModel(filter: filter))
    }
}

struct UpcomingLaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesView(filter: .past)
    }
}
