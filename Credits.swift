import SwiftUI
struct creditsView: View {
    var body: some View {
        VStack{
                Text("Credits").font(.system(size: 90, weight: .semibold, design: .serif))
                    .padding()
                    .offset(y: -350)
            
            Text("Thanks for checking out our app!")
                .font(.system(size: 50, weight: .semibold, design: .serif))
                    .padding()
                    .offset(y: -300)
            Text("Thanks to Cassandra B, Ola O, Karima B, and Sara A!")
                .font(.system(size: 30, weight: .semibold, design: .serif))
                    .padding()
                    .offset(y: -200)
            
            Image("Blober")
                
                
            }
        
        }
    }


