//
//  Assignment.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI

struct Assignment: View {
    @State var data = ""
    var body: some View {
        TextField("Enter assignment", text: $data)
    }
}
