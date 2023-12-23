//
//  UpdateContactUseCaseProtocol.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
protocol UpdateContactUseCaseProtocol {
    func execute(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError>
}
