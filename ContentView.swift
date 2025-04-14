import SwiftUI

struct ContentView: View {
    @State var items: [AssignmentItem] = []
    
    var body: some View {
        //datepicker
        ZStack{
            Color.blue
                .opacity(0.3)
            VStack{
                
                Text("🤍 Assignments 🤍")  .font(.system(size: 35, weight: .semibold, design: .serif))
                    .frame(alignment: .top)
                    .padding()
                
                
                HeaderView(items: $items, showSheet: false)
                ForEach(items, id: \.self){ CurrentItem in
                    ListView(currentItem: CurrentItem)
                }
                .onDelete { indexset in
                    items.remove(atOffsets: indexset)
            }
            }
            //        Button(action: , label: {
            //            Image(systemName: "heart.text.clipboard")
            //                .symbolRenderingMode(.multicolor)
        }
//        })
        
    }
}

#Preview{
    ContentView()
}
