//
//  ContactCreateViewModel.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
class ContactCreateViewModel: ObservableObject{
    private let createContactUseCase: CreateContactUseCaseProtocol
    
    init(){
        self.createContactUseCase = Resolver.shared.resolve(CreateContactUseCaseProtocol.self)
    }
    
    @Published var errorMessage = ""
    @Published var name = ""
    @Published var number = ""
    @Published var showAlert = false
    
    
    
    func createContact() async{
        
        let result = await self.createContactUseCase.execute(ContactRequestModel(name: self.name,number: self.number))
        switch result{
        case .success(_):
            self.errorMessage = ""
        case .failure(_):
            self.errorMessage = "Error Creating Contact"
        }
        
    }
    
    var canSave: Bool {
        return (!name.isEmpty);
    }
    
}
