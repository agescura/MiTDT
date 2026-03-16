import ComposableArchitecture
import Models
import SwiftUI

@Reducer
public struct AppFeature {
  @ObservableState
  public struct State: Equatable {
    public var selectedTab: Tabs

    public init(
      selectedTab: Tabs = .home
    ) {
      self.selectedTab = selectedTab
    }
  }

  public enum Action: BindableAction {
    case binding(BindingAction<State>)
  }

  public init() {}

  public var body: some Reducer<State, Action> {
    Reduce { state, action in
      return .none
    }
  }
}

public struct AppView: View {
  @Bindable public var store: StoreOf<AppFeature>
  
  public init(
    store: StoreOf<AppFeature>
  ) {
    self.store = store
  }

  public var body: some View {
    TabView(selection: $store.selectedTab) {
      Tab("Home", systemImage: "house.fill", value: .home) {
        NavigationStack {
          ContentUnavailableView(
            "Home",
            systemImage: "house.fill",
            description: Text("Home tab")
          )
          .navigationTitle("Home")
        }
      }
      Tab("TV", systemImage: "tv.fill", value: .tv) {
        NavigationStack {
          ContentUnavailableView(
            "TV",
            systemImage: "tv.fill",
            description: Text("TV tab")
          )
          .navigationTitle("TV")
        }
      }
      Tab("Radio", systemImage: "radio.fill", value: .radio) {
        NavigationStack {
          ContentUnavailableView(
            "Radio",
            systemImage: "radio.fill",
            description: Text("Radio tab")
          )
          .navigationTitle("Radio")
        }
      }
      Tab("Settings", systemImage: "gearshape.fill", value: .settings) {
        NavigationStack {
          ContentUnavailableView(
            "Settings",
            systemImage: "gearshape.fill",
            description: Text("Settings tab")
          )
          .navigationTitle("Settings")
        }
      }
      Tab("Search", systemImage: "magnifyingglass", value: .search, role: .search) {
        NavigationStack {
          ContentUnavailableView(
            "Search",
            systemImage: "magnifyingglass",
            description: Text("search tab")
          )
          .navigationTitle("Search")
        }
      }
    }
  }
}

#Preview {
  AppView(
    store: Store(
      initialState: AppFeature.State(),
      reducer: { AppFeature() }
    )
  )
}
