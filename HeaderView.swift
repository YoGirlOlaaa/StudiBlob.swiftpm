//
//  HeaderView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI

struct HeaderView: View {
    @Binding var items: [AssignmentItem]
    @State var newItemName: String = ""
    @State var newItemDescription: String = ""
    @State var newDueDate = Date()
    @State var selectedPoints: Double = 50.0
//    @State var totalPoints = 0
    @AppStorage("totalPoints") var totalPoints: Int = 0
    @State var showSheet: Bool
    @State var showSheet1 = false
    
    var body: some View {
        
        Button{
            showSheet.toggle()
        } label: {
            HStack{
                Text("Add An Assignment")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                Image(systemName: "plus.diamond")
                 .foregroundStyle(.blue)
                
            }
        }
        .sheet(isPresented: $showSheet){
            VStack{
                
                Text("Add The New Assignment")
                    .font(.largeTitle)
                Divider()
                    .padding()
                
                VStack {
                    Text("Due: \(newDueDate, formatter: dateFormatter)")
                        .padding()
                    
                    Button("Change due date") {
                        showSheet1.toggle()
                    }
                    .padding()
                     .foregroundStyle(.blue)
                    
                    
                    
                    .sheet(isPresented: $showSheet1) {
                        VStack {
                            
                            DatePicker(
                                "Select Date and Time",
                                selection: $newDueDate,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .datePickerStyle(.graphical)
                            .padding()
                             .foregroundStyle(.blue)
                            
                            Button("Done") {
                                showSheet1.toggle()
                                
                            }
                            .padding()
                             .foregroundStyle(.blue)
                        }
                        .presentationDetents([.medium, .large])
                    }
                }
                
                VStack{
                    Text("Assignment Name")
                    TextField("Assignment name", text: $newItemName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack{
                    Text("Assignment description")
                    TextField("Assignment description", text: $newItemDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Slider(value: $selectedPoints, in: 0...100, step: 1)
                
                
                Button {
                    defaultName()
                    let newItem = AssignmentItem(name: newItemName, description: newItemDescription, date: newDueDate, points: Int(selectedPoints))
                    items.append(newItem)
                    items.sort { $0.date < $1.date }
//                    totalPoints += Int(selectedPoints)
                    newItemName = ""
                    newItemDescription = ""
                     newDueDate = Date()
                    showSheet.toggle()
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 500, height: 50)
                        Text("Complete Finish Assignment")
                            .foregroundStyle(.black)
                    }
                }
                
                
                
            }
        }
    }
    func defaultName() {
        if newItemName == ""{
            newItemName = "No Assignment Name"
        }
        if newItemDescription == ""{
            newItemDescription = "No Description"
        }
        
    }
    }

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
    }()
