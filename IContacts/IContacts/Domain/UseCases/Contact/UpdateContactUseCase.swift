//
//  UpdateContactUseCase.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
class UpdateContactUseCase: UpdateContactUseCaseProtocol {
    private let contactRepo: UpdateContactUseCaseProtocol
    init(contactRepo: UpdateContactUseCaseProtocol) {
        self.contactRepo = contactRepo
    }
    func execute(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError> {
        return await self.contactRepo.execute(id: id, data: data)
    }
    
    
}
