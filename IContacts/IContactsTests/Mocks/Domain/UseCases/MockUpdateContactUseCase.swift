//
//  MockUpdateContactUseCase.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import Foundation
class MockUpdateContactUseCase : UpdateContactUseCaseProtocol {
    var executeResult: Result<Bool, ContactError> = .success(false)
    var executeGotCalled = false
    var executeGotCalledWith = (UUID(), ContactRequestModel(name: "Some name", number: "323223"))
    func execute(id: UUID, data: IContacts.ContactRequestModel) async -> Result<Bool, IContacts.ContactError> {
        executeGotCalled = true
        executeGotCalledWith = (id,data)
        return executeResult 
    }
    
    
}
