import SwiftUI
import SwiftData

@main
struct TheGuildBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Character.self])
    }
}


