//
//  Wardrobe.swift
//  AppShowCase.swiftpm
//
//  Created by Cassandra Botnari on 5/5/25.
//

import SwiftUI

struct Wardrobe: View {
    @Binding var assetHat: String
    @Binding var assetEyes: String
    let menuItems = ["Crown", "Horns", "Black Top Hat", "Hearts", "Leafy Hat", "Credits", "Help"]
    let menuEyes = ["Eyelids 1", "Eyelashes 1", "Black Top Hat", "Hearts", "Leafy Hat", "Witch Hat", "Help"]
    //    these have to be replaced with the bought items
    var body: some View {
        
        ZStack(alignment: .top){
           // Image("Image")
//                .resizable()
//                .scaledToFill()
//                .frame(maxHeight: 200)
//                .clipped()
//                .ignoresSafeArea(edges:.top)
//            
            
            Text("Welcome To Your Wardrobe")
                .font(.system(size: 55, weight: .semibold, design: .serif))
                .frame(alignment: .top)
            
            VStack(spacing: 20) {
                Spacer().frame(height:50)
                Text("Click to put on an item")
                    .font(.system(size: 30, weight: .semibold, design: .serif))
                    .frame(alignment: .top)
            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    
                    ForEach(menuItems, id: \.self) { item in
                        Button(action: {
                            assetHat = item
                        })  {
                            
                            ZStack{
                                Image(item)
                                    .resizable()
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 20, height: 20)
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
                    }.frame(height: 300)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10){
                        ForEach(menuEyes, id: \.self) { item in
                            Button(action: {
                                assetEyes = item
                            })  {
                                ZStack{
                                    Image(item)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 20, height: 20)
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
                Spacer()
                
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
        
        
        
        
        
        
    }
    
//    #Preview {
//        Wardrobe(assetHat: $assetHat, assetEyes: $assetEyes)
//    }

