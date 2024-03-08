import SwiftUI

@main
struct UserInformationApp: App {
    @StateObject private var store = UserStore()
    
    var body: some Scene {
        WindowGroup {
            FormPageView(user: $store.user, temp: store.temp) {
                Task {
                    do {
                        try await store.save(user: store.user)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
        }
    }
}
