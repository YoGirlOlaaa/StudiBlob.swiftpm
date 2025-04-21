//
//  ImageSliderView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/21/25.
//
import SwiftUI

struct ImageSliderView: View {
  
    let images = ["Image1", "Image2", "Image3", "image4"]
    
    @State private var currentIndex: Double = 0
    
    var body: some View {
        VStack {
            
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .tag(Double(index))                         .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
         
            Slider(value: $currentIndex, in: 0...(Double(images.count - 1)), step: 1)
                .padding()
                .accentColor(.cyan)
            
            
            Text("Image \(Int(currentIndex) + 1) of \(images.count)")
                .font(.headline)
                .padding()
        }
        .padding()
    }
}
