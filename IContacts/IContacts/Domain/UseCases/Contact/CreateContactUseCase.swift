//
//  CreateContactUseCase.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
class CreateContactUseCase: CreateContactUseCaseProtocol {
    private let contactRepo: ContactRepositoryProtocol
    init(contactRepo: ContactRepositoryProtocol) {
        self.contactRepo = contactRepo
    }
    func execute(_ contact: ContactRequestModel) async -> Result<Bool, ContactError> {
        return await self.contactRepo.createContact(contact)
    }
    
   
}

