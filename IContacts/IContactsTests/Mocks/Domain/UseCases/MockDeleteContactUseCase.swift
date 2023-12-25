//
//  MockDeleteContactUseCase.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import Foundation
class MockDeleteContactUseCase: DeleteContactUseCaseProtocol {
    var executeResult: Result<Bool, ContactError> = .success(false)
    var executeGotCalled = false
    var executeGotCalledWith = (UUID())
    func execute(_ id: UUID) async -> Result<Bool, IContacts.ContactError> {
        executeGotCalled = true
        executeGotCalledWith = (id)
        return executeResult
    }
    
    
}
