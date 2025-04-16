import SwiftUI

struct ContentView: View {
    @State var items: [AssignmentItem] = []
    
    var body: some View {
        //datepicker
        
        NavigationStack {
            VStack {
              
                
                ZStack{
                    Color.blue
                        .opacity(0.3)
                    VStack{
                        
                        
                        
                        Text("StudiBlob").font(.system(size: 35, weight: .semibold, design: .serif))
                            .frame(alignment: .top)
                            .padding()
                        
                        VStack{
                            HeaderView(items: $items, showSheet: false)
                            ForEach(items, id: \.self){ CurrentItem in
                                ListView(currentItem: CurrentItem)
                            }
                            .onDelete { indexset in
                                items.remove(atOffsets: indexset)
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
