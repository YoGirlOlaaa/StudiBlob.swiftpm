//
//  Store.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/16/25.
//

import SwiftUI

struct Store: View {
    var body: some View {
        VStack {
            Text("This is the full screen page")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Button("Back to Main Page") {
                // Action to navigate back to the main page
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        .edgesIgnoringSafeArea(.all) // This ensures the page takes up the full screen
    }
}
#Preview {
    Store()
}
