//
//  GetContactUseCaseProtocol.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
protocol GetContactUseCaseProtocol {
    func execute(_ id: UUID) async ->
        Result<ContactResponseModel?, ContactError>
}
