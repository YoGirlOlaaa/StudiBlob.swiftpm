//
//  HeaderView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
// code to add an assignment with description, and date

import SwiftUI

struct HeaderView: View {
    @Environment(\.modelContext) var context
    
     @State var newItemName: String = ""
     @State var newItemDescription: String = ""
     @State var newDueDate = Date()
     @State var selectedPoints: Double = 50.0
     @AppStorage("totalPoints") var totalPoints: Int = 0
     @State var showSheet: Bool
     @State var showSheet1: Bool

    
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
                //assignment information
                Text("Add The New Assignment")
                    .font(.system(size: 40, weight: .semibold, design: .serif))
                        .foregroundStyle(.black)
                Divider()
                    .padding()
                
                VStack {
                    Text("Due: \(newDueDate, formatter: dateFormatter)")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                            .foregroundStyle(.black)
                        .padding()
                    
                    Button {
                        showSheet1.toggle()
                    } label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 30)
                                .foregroundStyle(.blue)
                            Text("Change Due Date")
                                .font(.system(size: 15, weight: .semibold, design: .serif))
                                .foregroundStyle(.white)
                        }
                    }
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
                        .font(.system(size: 25, weight: .semibold, design: .serif))
                            .foregroundStyle(.black)
                    TextField("Put Your Assignment Name Here", text: $newItemName)
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.black)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        
                }
                VStack{
                    Text("Assignment Description")
                        .font(.system(size: 25, weight: .semibold, design: .serif))
                    TextField("Put Your Assignment Despription Here", text: $newItemDescription)
                        .frame(width: 500, height: 50)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Slider(value: $selectedPoints, in: 0...20, step: 1)
                Text(String(format: "Your assignment is worth %.0f points", selectedPoints))
                
            Button{
                    
                if newItemName == ""{
                    newItemName = "No Assignment Name"
                }
                if newItemDescription == ""{
                    newItemDescription = "No Description"
                }
                    let newAssignment = AssignmentItem(
                        name: newItemName,
                        description: newItemDescription,
                        date: newDueDate,
                        points: Int(selectedPoints)
                    )
                   
                    context.insert(newAssignment)
                    
                    newItemName = ""
                    newItemDescription = ""
                    newDueDate = Date()
                    showSheet.toggle()
                    
                } label: {
                   
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 500, height: 50)
                                .foregroundStyle(.blue)
                            Text("Complete Creating Assignment")
                                .font(.system(size: 30, weight: .semibold, design: .serif))
                                .foregroundStyle(.white)
                        }
                            
                    
                }
                
                
                
            }
        }
    }
//    func addAssignment(name: String, dueDate: Date, Description: String, points: Int) {
//        let newAssignment = AssignmentItem(name: newItemName, description: newItemDescription, date: newDueDate, points: Int(selectedPoints))
//    }
//    
    
    


let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
    }()



