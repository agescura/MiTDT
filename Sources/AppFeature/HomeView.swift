import ComposableArchitecture
import SwiftUI

@Reducer
public struct HomeFeature {
  public init() {}
  @ObservableState
  public struct State: Equatable {
    public init() {}
  }
}

public struct HomeView: View {
  @Bindable var store: StoreOf<HomeFeature>
  
  public init(
    store: StoreOf<HomeFeature>
  ) {
    self.store = store
  }
  
  public var body: some View {
    Text("Home")
      .navigationTitle("Home")
      .toolbar {
        ToolbarItem {
          Image(systemName: "speaker.slash.fill")
        }
        ToolbarSpacer()
        ToolbarItem {
          Text("AG")
        }
      }
  }
}

#Preview {
  NavigationStack {
    HomeView(
      store: Store(
        initialState: HomeFeature.State(),
        reducer: { HomeFeature() }
      )
    )
  }
}
