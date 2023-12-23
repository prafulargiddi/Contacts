//
//  GetAllContact.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
class GetAllContactUseCase : GetAllContactUseCaseProtocol {
    private let contactRepo: ContactRepositoryProtocol
    init(contactRepo: ContactRepositoryProtocol) {
        self.contactRepo = contactRepo
    }
    func execute() async -> Result<[ContactResponseModel], ContactError> {
        return await self.contactRepo.getContacts()
    }
    
    
}
