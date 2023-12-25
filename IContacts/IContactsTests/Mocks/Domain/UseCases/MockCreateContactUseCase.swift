//
//  MockCreateContactUseCase.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import Foundation
class MockCreateContactUseCase: CreateContactUseCaseProtocol {
    var executeResult: Result<Bool, ContactError> = .success(true)
    var executeGotCalled = false
    var exceuteGotCalledWith: ContactRequestModel?
    func execute(_ contact: IContacts.ContactRequestModel) async -> Result<Bool, IContacts.ContactError> {
        executeGotCalled = true
        exceuteGotCalledWith = contact
        return executeResult
    }
    
    
}

