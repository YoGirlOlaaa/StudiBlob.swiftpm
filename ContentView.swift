import SwiftUI

struct ContentView: View {
    @State var items: [AssignmentItem] = []
    @ObservedObject var storage = AssignmentStorage()
    
    var body: some View {
        //datepicker
        
        NavigationStack {
            VStack {
                
                
                ZStack{
                    Color.blue
                     //   .opacity(0.3)
                    VStack{
                        
                        
                        
                        Text("StudiBlob").font(.system(size: 55, weight: .semibold, design: .serif))
                            .frame(alignment: .top)
                            .padding()
                        
                       
                            VStack{
                                
                                HeaderView(items: $storage.items, showSheet: false)
                                ForEach(storage.items, id: \.self){ CurrentItem in
                                    ListView(currentItem: CurrentItem)
                                }
                                .onDelete { indexSet in
                                    storage.items.remove(atOffsets: indexSet)
                                }
                            }
                    }
                }
                
                // NavigationLink to push to the new screen
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

