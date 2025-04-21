//
//  ImageSliderView2.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/21/25.
//

import SwiftUI

struct ImageSliderView2: View {
  
    let images2 = ["Image1", "Image2", "Image3", "Image4"]
    
    @State private var currentIndex: Double = 0
    
    var body: some View {
        VStack {
            
            TabView(selection: $currentIndex) {
                ForEach(0..<images2.count, id: \.self) { index in
                    Image(images2[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: 180)
                        .tag(Double(index))                         .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
         
            Slider(value: $currentIndex, in: 0...(Double(images2.count - 1)), step: 1)
                
                .accentColor(.cyan)
            
            
            Text("Image \(Int(currentIndex) + 1) of \(images2.count)")
                .font(.headline)
                .padding()
        }
        .padding()
        
    }
}
