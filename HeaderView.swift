//
//  HeaderView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI

struct HeaderView: View {
    @Binding var items: [AssignmentItem] 
    @State var itemCount = 1
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
            ZStack{
                Capsule()
                    .frame(width: 500, height: 55)
                    .foregroundStyle(.blue)
            HStack{
                
                    Text("Add An Assignment")
                    .font(.system(size: 40, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                    Image(systemName: "plus.diamond")
                        .foregroundStyle(.white)
                }
                
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
                
                Slider(value: $selectedPoints, in: 0...20, step: 1)
                Text(String(format: "Your assignment is worth %.0f points", selectedPoints))
                
                Button {
                    defaultName()
                    let newItem = AssignmentItem(name: newItemName, description: newItemDescription, date: newDueDate, points: Int(selectedPoints))
                    itemCount += 1
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
                        Text("Complete Creating Assignment")
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
