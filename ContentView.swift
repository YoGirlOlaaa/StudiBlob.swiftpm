import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var items: [AssignmentItem] = []
    @State var selectedPoints: Double = 50.0
    @AppStorage("totalPoints") var totalPoints: Int = 0
    @State var asset = ""
    @State var instruction = false
    
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
                                .resizable()
                                .frame(width: 170, height: 130)
                            
                        }
                        VStack{
                            HeaderView(showSheet: false, showSheet1: false)
                            List{
                                ForEach(items, id: \.self){ currentItem in
                                    ListView(currentItem: currentItem)
                                }
                                
                                HStack{
                                    ZStack{
                                        
                                        Image("Blober")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 8000, height: 700)
                                        
                                        ZStack {
                                          
                                            if items.indices.contains(0) {
                                                ListView(currentItem: AssignmentItem(name: items[0].name, description: items[0].name, date: Date(), points: 50))
                                                    .padding(.top, 50)
                                                    .padding(.trailing, 1000)
                                            }
                                            
                                           
                                            if items.indices.contains(1) {
                                                ListView(currentItem: AssignmentItem(name: items[1].name, description: items[1].name, date: Date(), points: 50))
                                                    .padding(.top, 50)
                                                    .padding(.leading, 1000)
                                            }
                                            
                                            
                                            if items.indices.contains(2) {
                                                ListView(currentItem: AssignmentItem(name: items[2].name, description: items[2].name, date: Date(), points: 50))
                                                    .padding(.bottom, 600)
                                                    .padding(.trailing, 1000)
                                            }
                                            
                                            
                                            if items.indices.contains(3) {
                                                ListView(currentItem: AssignmentItem(name: items[3].name, description: items[3].name, date: Date(), points: 50))
                                                    .padding(.bottom, 600)
                                                    .padding(.leading, 1000)
                                            }
                                            
                                            if items.indices.contains(4) {
                                                ListView(currentItem: AssignmentItem(name: items[4].name, description: items[4].name, date: Date(), points: 50))
                                                    .padding(.bottom, 600)
                                                    
                                            }
                                        }
                                    }
                                    Spacer()
                                    Image(asset)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }
                
                HStack{
                    NavigationLink(destination: Store()) {
                        Text("Go to the Store")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: Wardrobe()) {
                        Text("Go to your Wardrobe")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                            .padding()
                        
                        HStack{
                            //
                            Button(action: {
                                instruction.toggle()
                            }) {
                                Image(systemName: "info.circle")
                                    .frame(alignment: .leading)
                                    .font(.system(size: 40))
                                    .foregroundColor(.blue)
                                
                                
                            }
                            .sheet(isPresented: $instruction) {
                                InstructionView(instruction: $instruction)
                            }
                        }
                    }
                    
                }
                
            }
            
        }
    }
    
    struct InstructionView: View {
        @Binding var instruction: Bool
        var body: some View {
            VStack(spacing:20) {
                //how to use study blob
                Text("How to use StudiBlob")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .bold()
                    .padding()
                Text("1. Click 'Add an Asignment' to create a new assignment.")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                Text("2. Completeing assignment gives you points that you can use to the store.")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                Text("3. Click 'Go to the Store' to see your points and how much you can spend on your favorite items.")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                Button("Close"){
                    instruction = false
                }
                .font(.title)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
        }
    }
    
}
