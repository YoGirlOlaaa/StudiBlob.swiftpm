//
//  ListView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI

struct ListView: View{
    let currentItem: AssignmentItem
    var body: some View{
        ZStack{
            
            
                
            VStack{
                Text("\(currentItem.name) ")
                    .bold()
                Text("Due: \(currentItem.date, formatter: dateFormatter)")
                
                Text("\(currentItem.description)")
                
            }
        }
        .font(.largeTitle)
    }
}

#Preview {
    ListView(currentItem: AssignmentItem(name: "testing", description: "testing", date: Date(), points: 47))
}
