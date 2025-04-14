import SwiftUI

struct ContentView: View {
    @State var items: [AssignmentItem] = []
    
    var body: some View {
        //datepicker
        ZStack{
            Color.blue
                .opacity(0.3)
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
}

#Preview{
    ContentView()
}
