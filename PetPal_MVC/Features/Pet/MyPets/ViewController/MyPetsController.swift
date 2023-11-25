//
//  MyPetsController.swift
//  PetPal_MVC
//
//  Created by James Vieyra on 2023/11/25.
//

import SwiftUI

class MyPetsController: ObservableObject {
    
    
    @Published var addNewPet: Bool = false
    @Published var newPet: NewPetViewController?
      
    struct ContentView: View {
        @ObservedObject var viewController: MyPetsController
        @Environment(\.managedObjectContext) var viewContext
        
        var body: some View {
            VStack {
                Text("Here are your fur babies:")
   
            }
            .toolbar {
                title
                addNewPet
            }
            .sheet(isPresented: $viewController.addNewPet) {
                if let newPet = viewController.newPet {
                    NewPetViewController.ContentView(viewController: newPet)
                        .environment(\.managedObjectContext, viewContext)
                }
            }
        }
        
        private var addNewPet: some ToolbarContent {
            ToolbarButton(placement: .topBarTrailing) {
                viewController.newPet = NewPetViewController()
                viewController.addNewPet = true
            } label: {
                Image(systemName: "plus.circle")
            }
        }
        
        private var title: some ToolbarContent {
            ToolbarItem(placement: .principal) {
                Text("My Pets")
                    .font(.title.weight(.heavy))
            }
        }
    }
}
