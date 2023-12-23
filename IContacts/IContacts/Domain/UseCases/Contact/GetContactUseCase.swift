//
//  GetContactUseCase.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
class GetContactUseCase : GetContactUseCaseProtocol {
    
    
    private let contactRepo: ContactRepositoryProtocol
    init(contactRepo: ContactRepositoryProtocol) {
        self.contactRepo = contactRepo
    }
    func execute(_ id: UUID) async -> Result<ContactResponseModel?, ContactError> {
        return await contactRepo.getContact(id)
    }
}
