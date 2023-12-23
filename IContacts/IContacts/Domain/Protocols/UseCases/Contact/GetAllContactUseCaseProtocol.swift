//
//  GetAllContactUseCaseProtocol.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
protocol GetAllContactUseCaseProtocol {
    func execute() async ->Result<[ContactResponseModel],ContactError>
}
