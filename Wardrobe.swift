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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        
                        ForEach(menuItems, id: \.self) { item in
                            Button(action: {
                                
                            }) {
                                Text(item)
                                    .font(.title2)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(width: 200)
                                    .shadow(radius: 5)
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
