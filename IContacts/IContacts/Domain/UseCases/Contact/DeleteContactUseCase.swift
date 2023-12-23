//
//  DeleteContactUseCase.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
class DeleteContactUseCase : DeleteContactUseCaseProtocol {
    private let contactRepo: ContactRepositoryProtocol
    init(contactRepo: ContactRepositoryProtocol) {
        self.contactRepo = contactRepo
    }
    func execute(_ id: UUID) async -> Result<Bool, ContactError> {
        return await self.contactRepo.deleteContact(id)
    }
    
    
}
