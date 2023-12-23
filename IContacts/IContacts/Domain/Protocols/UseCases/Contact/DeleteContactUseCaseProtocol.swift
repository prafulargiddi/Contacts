//
//  DeleteContactUseCaseProtocol.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
protocol DeleteContactUseCaseProtocol {
    func execute(_ id: UUID) async -> Result<Bool, ContactError>
}
