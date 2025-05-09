//
//  ListView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//
// creation of list view that shows how the user is able to add their assignment name, a description, and a date.

import SwiftUI

struct ListView: View{
    let currentItem: AssignmentItem
    var body: some View{
        ZStack{
            
            Image("texter")
                .resizable()
                .frame(width: 400, height: 400)
                
            VStack{
                
                Text("\(currentItem.name) ")
                    .font(.system(size: 35, weight: .semibold, design: .serif))
                        .offset(y: -70)
                        .frame(width: 350)
                Text("Due: \(currentItem.date, formatter: dateFormatter)")
                    .offset(y: -60)
                    .font(.system(size: 25, weight: .semibold))
                Text("\(currentItem.descriptionn)")
                    .font(.system(size: 30))
                    .offset(y: -60)
                    .frame(width: 350)
            }
        }
        .font(.title)
    }
}

#Preview {
    ListView(currentItem: AssignmentItem(name: "Testing", description: "testinghfofsorffugpods8iurhfuhirufhrhgshgutfpo8dhrpgudwo", date: Date(), points: 47))
}

// current item represents a single item (aka assignmentItem) that shows what you want to display in list view.It holds details like the name, description, due date, and points for the assignment.
