//
//  Wardrobe.swift
//  AppShowCase.swiftpm
//
//  Created by Cassandra Botnari on 5/5/25.
//

import SwiftUI

struct Wardrobe: View {
    let menuItems = ["Start Game", "Options", "High Scores", "Exit", "Settings", "Credits", "Help"]
//    these have to be replaced with the bought items
    var body: some View {
        Text("Welcome To Your Wardrobe")
            .font(.system(size: 55, weight: .semibold, design: .serif))
                .frame(alignment: .top)
        Text("Click to put on an item")
            .font(.system(size: 30, weight: .semibold, design: .serif))
                .frame(alignment: .top)
        
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        
                        ForEach(menuItems, id: \.self) { item in
                            Button(action: {
                                
                            }) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 200)
                                    Text(item)
                                        .font(.title2)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        
                                        .shadow(radius: 5)
                                }
//                                make this fit and look how you want it to
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 150)
            }
           
    
    
    
    
    
    
    
    
    
}

#Preview {
    Wardrobe()
}
