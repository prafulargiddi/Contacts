//
//  MockGetAllContactUseCase.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import Foundation
class MockGetAllContactUseCase: GetAllContactUseCaseProtocol{
    var executeResult: Result<[ContactResponseModel],ContactError> = .success([])
    var executeGotCalled = false
    
    func execute() async -> Result<[IContacts.ContactResponseModel], IContacts.ContactError> {
        executeGotCalled = true
        return executeResult
    }
    
    
}
