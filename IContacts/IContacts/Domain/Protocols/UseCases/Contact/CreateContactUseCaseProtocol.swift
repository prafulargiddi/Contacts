//
//  CreateContactUseCaseProtocol.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
protocol CreateContactUseCaseProtocol {
    func execute(_ contact: ContactRequestModel) async -> Result<Bool, ContactError>
}
