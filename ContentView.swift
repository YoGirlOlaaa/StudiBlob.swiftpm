import SwiftUI

struct ContentView: View {
    @State var items: [AssignmentItem] = []
    @ObservedObject var storage = AssignmentStorage()
    @State var selectedPoints: Double = 50.0
    @AppStorage("totalPoints") var totalPoints: Int = 0
    var body: some View {
        //StudiBlob backround
        
        NavigationStack {
            
            VStack {
                
                
                ZStack{
                    Color.blue
                        .opacity(0.3)
                    VStack{
                        
                        
                        HStack{
                            Text("StudiBlob").font(.system(size: 55, weight: .semibold, design: .serif))
                                .frame(alignment: .top)
                                .padding()
                            Image("Blober")
                            
                        }
                        VStack{
                            //if you delete an assignment, you will get points
                            HeaderView(items: $storage.items, showSheet: false)
                            List{
                                ForEach(storage.items, id: \.self){ currentItem in
                                    ListView(currentItem: currentItem)
                                }
                                .onDelete{ indexSet in storage.items.remove(atOffsets: indexSet)
                                    totalPoints += Int(selectedPoints)
                                }
                                    
                                Image("Blober")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 9000, height: 800)
                                    Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }
                
                //button to go to the store
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
