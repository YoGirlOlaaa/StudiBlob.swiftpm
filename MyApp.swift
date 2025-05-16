import SwiftUI
import SwiftData

@main
struct MyApp: App {
   
    var body: some Scene {
        //if showApp{
        WindowGroup {
            ContentView()
                .modelContainer(for: AssignmentItem.self)
        }
    }
}
//                }else{
//                    Image("BG")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                                .edgesIgnoringSafeArea(.top)
//                                .opacity(0.4)
//                    Image("Blober")
//                        .resizable()
//                        .frame(width: 400, height: 300)
//                         .imageScale(.large)
//                        .transition(.opacity)
//
//                }
//
//            }
//            .animation(.easeInOut(duration: 0.2), value: showApp)
//            .onAppear(){
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
//                    withAnimation{
//                        showApp = true
//                    }
//                }
