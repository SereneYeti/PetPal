//
//  NewPetViewController.swift
//  PetPal_MVC
//
//  Created by James Vieyra on 2023/11/25.
//

import SwiftUI
import CoreData

class NewPetViewController: ObservableObject {
    
    @Published var name: String = ""
    @Published var age: Date = .now
    @Published var breed: String = ""
    @Published var owner: String = ""
        
    func clearState() {
        name = ""
        age = .now
        owner = ""
        breed = ""
    }
    
    
    func savePet(using viewModel: RootViewModel, in context: NSManagedObjectContext) {
        let pet = Pet(context: context)
        
        pet.name = name
        pet.breed = breed
        pet.owner = owner
        pet.age = age
        
        viewModel.dataManager.saveContext(context)
    }
    
    struct ContentView: View {
        @ObservedObject var viewModel = RootViewModel.shared
        @ObservedObject var viewController: NewPetViewController
        
        @Environment(\.managedObjectContext) var viewContext
            
        var body: some View {
            NavigationStack {
                Form {
                    Section {
                        TextField("Name", text: $viewController.name)
                    } header: {
                        Text("Name")
                    }
                    
                    Section {
                        TextField("Owner", text: $viewController.name)
                    } header: {
                        Text("Owner")
                    }
                    
                    Section {
                        DatePicker("Age", selection: $viewController.age)
                    } header: {
                        Text("Age")
                    }
                    
                    Section {
                        TextField("Breed", text: $viewController.breed)
                    } header: {
                        Text("Breed")
                    }
                    
                    Section {
                        Button {
                            print("save")
                            viewModel.myPetsController?.addNewPet = false
                            viewController.savePet(using: viewModel, in: viewContext)
                        } label: {
                            Text("Save your fur baby")
                        }
                    }

                }
                .onDisappear {
                    viewController.clearState()
                }
                .toolbar {
                    title
                }
            }
        }
        
        private var title: some ToolbarContent {
            ToolbarItem(placement: .principal) {
                Text("Add a fur baby")
                    .font(.title.weight(.heavy))
            }
        }
    }
}
