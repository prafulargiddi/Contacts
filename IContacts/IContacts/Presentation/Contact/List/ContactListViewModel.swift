//
//  ContactListViewModel.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation

class ContactListViewModel: ObservableObject {
    private let getAllContacts: GetAllContactUseCaseProtocol
    private let deleteContact: DeleteContactUseCaseProtocol
    init(getAllContacts: GetAllContactUseCaseProtocol,
deleteContact: DeleteContactUseCaseProtocol)
    {
        self.getAllContacts = getAllContacts
        self.deleteContact = deleteContact
    }
    @Published var errorMessage = ""
    @Published var contacts: [ContactResponseModel] = []
    
    func deleteContact(_ id: UUID) async {
        let result = await self.deleteContact.execute(id)
        switch result {
        case .success(_):
            self.errorMessage = ""
            
        case .failure(_):
            self.errorMessage = "Error Deleting Contact"
        }
    }
    func getContacts() async {
        let result = await self.getAllContacts.execute()
        switch result {
        case .success(let contacts):
            self.contacts = contacts
        case .failure(_):
            self.errorMessage = "Error Fetching Contacts"
        }
    }
}
