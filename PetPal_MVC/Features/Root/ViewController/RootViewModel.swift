//
//  RootViewModel.swift
//  PetPal_MVC
//
//  Created by James Vieyra on 2023/11/25.
//

import SwiftUI
import CoreData

class RootViewModel: ObservableObject {
    @ObservedObject var dataManager = DataManager()
    @Published var myPetsController: MyPetsController?
    
    static let shared = RootViewModel()
    
    func initialSetup(_ petsController: MyPetsController? = nil) {
        myPetsController = petsController ?? MyPetsController()
    }
    
    struct ContentView: View {
        @ObservedObject var viewController: RootViewModel
    
        var body: some View {
            VStack {
                if let petsController = viewController.myPetsController {
                    MyPetsController.ContentView(viewController: petsController)
                        .environment(\.managedObjectContext, viewController.dataManager.container.viewContext)
                }
            }
            .onAppear {
                viewController.initialSetup()
            }
        }
    }
}

extension RootViewModel.ContentView {
    init(_ viewController: RootViewModel) {
        self.viewController = viewController
    }
}
