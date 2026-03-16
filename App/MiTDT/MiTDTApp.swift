import AppFeature
import ComposableArchitecture
import SwiftUI

@main
struct MiTDTApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(
        store: Store(
          initialState: AppFeature.State(),
          reducer: { AppFeature() }
        )
      )
    }
  }
}
