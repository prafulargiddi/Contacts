//
//  MockGetOneContactUseCase.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import Foundation
class MockGetOneContactUseCase: GetContactUseCaseProtocol {
    var executeResult: Result<ContactResponseModel?,ContactError> = .success(ContactResponseModel(id: UUID(), name: "Some name", number: "989843"))
    var executeGotCalled = false
    var executeGotCalledWidth: (UUID)!

    func execute(_ id: UUID) async -> Result<IContacts.ContactResponseModel?, IContacts.ContactError> {
        executeGotCalledWidth = (id)
        executeGotCalled = true
        return executeResult
    }
    
    
}
