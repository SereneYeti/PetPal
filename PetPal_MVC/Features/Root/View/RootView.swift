//
//  RootView.swift
//  PetPal_MVC
//
//  Created by James Vieyra on 2023/11/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var rootViewModel = RootViewModel.shared
    
    var body: some View {
        NavigationStack {
            RootViewModel.ContentView(rootViewModel)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    RootView()
}
