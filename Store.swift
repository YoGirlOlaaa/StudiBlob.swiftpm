//
//  Store.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/16/25.
//

import SwiftUI

struct Store: View {
    let images = ["image1", "image2", "image3", "image4"]
    
    var body: some View {
        VStack {
            Text("This is the full screen page")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Store").font(.system(size: 35, weight: .semibold, design: .serif))
                .frame(alignment: .top)
                .padding()
            
                ImageSliderView()
                    .padding()
            
            
        }
        
        .edgesIgnoringSafeArea(.all) 
    }
}
#Preview {
    Store()
}
