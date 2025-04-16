import SwiftUI

struct ContentView: View {
    @State var items: [AssignmentItem] = []
    @ObservedObject var storage = AssignmentStorage()
    
    var body: some View {
        //datepicker
        ZStack{
            Color.blue
                .opacity(0.3)
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
}

#Preview{
    ContentView()
}
