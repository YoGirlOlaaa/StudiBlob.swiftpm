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
                  
                    
                    
                    VStack{
                        
                        ZStack{
                            Image("Image")
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                
                                
                                
                            HStack{
                                
                                
                                Text("StudiBlob").font(.system(size: 55, weight: .semibold, design: .serif))
                                    .offset(y: 60)
                                    .padding()
                                
                            }
                        }
                        
                        VStack{
                            HeaderView(showSheet: false, showSheet1: false)
                           // List{
                               // ForEach(items, id: \.self){ currentItem in
                                 //   ListView(currentItem: currentItem)
                              //  }
                               // .onDelete(perform: deleteAssignment)
                               // }
                            ZStack{
                                
                                Image("Blober")
                                    .resizable()
                                    .frame(width: 1000, height: 800)
                                
                                if items.indices.contains(0) {
                                    ListView(currentItem: AssignmentItem(name: items[0].name, description: items[0].descriptionn, date: Date(), points: 50))
                                        .padding(.bottom, 550)
                                }
                                    
                                if items.indices.contains(1) {
                                    ListView(currentItem: AssignmentItem(name: items[1].name, description: items[1].descriptionn, date: Date(), points: 50))
                                        .padding(.trailing, 800)
                                        .padding(.bottom, 200)
                                }
                                if items.indices.contains(2) {
                                    ListView(currentItem: AssignmentItem(name: items[2].name, description: items[2].descriptionn, date: Date(), points: 50))
                                        .padding(.leading, 800)
                                        .padding(.bottom, 200)
                                }
                                if items.indices.contains(3) {
                                    ListView(currentItem: AssignmentItem(name: items[3].name, description: items[3].descriptionn, date: Date(), points: 50))
                                        .padding(.trailing, 800)
                                        .padding(.top, 500)
                                }
                                if items.indices.contains(4) {
                                    ListView(currentItem: AssignmentItem(name: items[4].name, description: items[4].descriptionn, date: Date(), points: 50))
                                        .padding(.leading, 800)
                                        .padding(.top, 500)
                                }

                                    
                            }
                                HStack{
                                    //                                    Image("Blober")
                                    //                                        .resizable()
                                    //                                        .scaledToFit()
                                    //                                        .frame(width: 9000, height: 800)
                                    Spacer()
                                    Image(asset)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    Spacer()
                }
                
                }
                
                HStack{
                    NavigationLink(destination: Store()) {
                        Text("Go to the Store")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .opacity(0.3)
                    }
                    NavigationLink(destination: Wardrobe()) {
                        Text("Go to your Wardrobe")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .opacity(0.3)
                            .padding()
                        
                        HStack{

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
                                    .foregroundStyle(.blue)
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
    

