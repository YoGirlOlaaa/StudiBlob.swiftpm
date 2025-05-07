import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State var items: [AssignmentItem] = []
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
                                .onDelete{ indexSet in items.remove(atOffsets: indexSet)
                                    totalPoints += Int(selectedPoints)
                                }
                                HStack{
                                    Image("Blober")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 9000, height: 800)
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
