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
            
                RoundedRectangle(cornerRadius: 25)
                    .fill(.gray)
                    .frame(width: 500, height: 200)
                    .opacity(0.1)
                
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
