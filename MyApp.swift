import SwiftUI
import SwiftData

@main
struct MyApp: App {
     @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    var body: some Scene {
        WindowGroup {
          if hasSeenOnboarding{
                ContentView()
                  .modelContainer(for: AssignmentItem.self)
            } else {
                
                OnboardingView()
            }
        }
    }
}
                
       
               
