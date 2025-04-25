import SwiftUI

struct ContentView: View {
    @State var items: [AssignmentItem] = []
    @ObservedObject var storage = AssignmentStorage()
    @State var selectedPoints: Double = 50.0
//    @Binding var totalPoints: Int
    @AppStorage("totalPoints") var totalPoints: Int = 0
    var body: some View {
        
        
        NavigationStack {
            
            VStack {
                
                
                ZStack{
                    Color.blue
                        .opacity(0.3)
                    VStack{
                        
                        
                        
                        Text("StudiBlob").font(.system(size: 55, weight: .semibold, design: .serif))
                            .frame(alignment: .top)
                            .padding()
                        
                       
                        VStack{
                            //fix. binding issue
                            HeaderView(items: $storage.items, showSheet: false)
                            List{
                                ForEach(storage.items, id: \.self){ currentItem in
                                    ListView(currentItem: currentItem)
                                }
                                .onDelete{ indexSet in storage.items.remove(atOffsets: indexSet)
                                    totalPoints += Int(selectedPoints)
                                }
                                    
                                Image("Blober")
                                    .frame(alignment: .center)
                            }
                        }
                    }
                }
                
                
                NavigationLink(destination: Store()) {
                    Text("Go to the Store")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            
        }
    }
}
