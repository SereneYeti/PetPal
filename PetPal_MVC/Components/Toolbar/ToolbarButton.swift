//
//  ToolbarButton.swift
//  PetPal
//
//  Created by James Vieyra on 2023/11/19.
//

import SwiftUI

struct ToolbarButton<Content: View>: ToolbarContent {
    let placement: ToolbarItemPlacement
    let action: () -> Void
    let label: () -> Content
    
    init(placement: ToolbarItemPlacement = .automatic, action: @escaping () -> Void, label: @escaping () -> Content) {
        self.placement = placement
        self.action = action
        self.label = label
    }
    
    var body: some ToolbarContent {
        ToolbarItem(placement: placement) {
            Button {
                action()
            } label: {
                label()
            }

        }
    }
}
