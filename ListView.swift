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
                Text("\(currentItem.description)")
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
// 
