//
//  ListView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//
// creation of list view that shows how the user is able to add their assignment name, a description, and a date.

import SwiftUI
import SwiftData

struct ListView: View{
    let currentItem: AssignmentItem
    @State var Delete = true
    @Environment(\.modelContext) var context
    @Query var items: [AssignmentItem] = []
    @AppStorage("totalPoints") var totalPoints: Int = 0
    @State var showDeleteAlert = false
    @State var showCompleteAlert = false
    var body: some View{
        ZStack{
            
            Image("texter")
                .resizable()
                .frame(width: 350, height: 350)
            
            VStack{
                
                Text("\(currentItem.name) ")
                    .font(.system(size: 35, weight: .semibold, design: .serif))
                    .offset(y: -50)
                    .frame(width: 320)
                Text("Due: \(currentItem.date, formatter: dateFormatter)")
                    .offset(y: -50)
                    .font(.system(size: 25, weight: .semibold))
                Text("\(currentItem.descriptionn)")
                    .font(.system(size: 30))
                    .offset(y: -50)
                    .frame(width: 320)
                HStack{
                    
                    
                    if Delete{
                        Button(action: {
                            showDeleteAlert = true
                            var counter = 0
                            for value in items {
                                if value.name == currentItem.name{
                                    print("Matching \(counter)")
                                }
                                counter += 1
                            }
                        }, label: {
                            Text("Delete")
                                .foregroundStyle(.red)
                                .font(.system(size: 25, weight: .semibold))
                            
                        })
                        .offset(CGSize(width: 0.0, height: -25.0))
                        .foregroundStyle(.red)
                        .font(.headline)
                        .alert("Are You Sure You Want To Delete This Assignment?", isPresented: $showDeleteAlert ){
                            Button("Delete", role: .destructive) {
                                deleteAssignment()
                            }
                            .foregroundStyle(.red)
                            Button("Cancel", role: .cancel) {
                                
                            }
                            .foregroundStyle(.red)
                        }
                        
                        
                        Button {
                            showCompleteAlert = true
                            var counter1 = 0
                            for value1 in items {
                                if value1.name == currentItem.name{
                                    print("Matching \(counter1)")
                                }
                                counter1 += 1
                            }
                        } label: {
                            Text("Complete")
                             
                            
                        }
                        .font(.system(size: 20, weight: .semibold))
                            .offset(CGSize(width: 0.0, height: -25.0))
                            .padding(.trailing, 10)
                            .foregroundStyle(.green)
                        .font(.headline)
                        .alert("Congrats for finishing an assignment! You earned \(totalPoints) points", isPresented: $showCompleteAlert ){
                            Button("Complete", role: .destructive) {
                                deleteAssignment()
                            }
                            .foregroundStyle(.red)
                            Button("Cancel", role: .cancel) {
                                
                            }
                            .foregroundStyle(.red)
                        }
                        
                    }
                    
                }
            }
        }
    }
    func deleteAssignment(){
        if let itemToDelete = items.first(where: { $0.totalPoints == currentItem.totalPoints }) {
            context.delete(itemToDelete)
            do {
                try context.save()
                print("Assignment with points \(itemToDelete.totalPoints) deleted.")
            } catch {
                print("Failed to delete assignment: \(error)")
            }
        } else {
            print("No assignment found with matching points.")
        }
        
    }
    
    
    func CompleteAssignment(){
        if let itemToComplete = items.first(where: { $0.totalPoints == currentItem.totalPoints }) {
            context.delete(itemToComplete)
            do {
                try context.save()
                print("Assignment with points \(itemToComplete.totalPoints) deleted.")
            } catch {
                print("Failed to delete assignment: \(error)")
            }
        } else {
            print("No assignment found with matching points.")
        }
        
    }
}

#Preview {
    ListView(currentItem: AssignmentItem(name: "Testing", description: "testinghfofsorffugpods8iurhfuhirufhrhgshgutfpo8dhrpgudwo", date: Date(), points: 47))
}

// current item represents a single item (aka assignmentItem) that shows what you want to display in list view.It holds details like the name, description, due date, and points for the assignment.
