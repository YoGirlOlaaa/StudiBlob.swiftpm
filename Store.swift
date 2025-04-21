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
            
            Text("Store").font(.system(size: 35, weight: .semibold, design: .serif))
                .frame(alignment: .top)
                .padding()
        }
        
        .edgesIgnoringSafeArea(.all) // This ensures the page takes up the full screen
    }
}
#Preview {
    Store()
}
