//
//  MockContactDataSource.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//

@testable import IContacts
import Foundation
final class MockContactDataSource: ContactDataSourceProtocol {
    var getAllResult: Result<[ContactResponseModel], ContactError> = .success([])
    var getAllGotCalled = false
    func getAll() async -> Result<[IContacts.ContactResponseModel], IContacts.ContactError> {
        getAllGotCalled = true
        return getAllResult
    }
    
    var getOneResult: Result<ContactResponseModel?,ContactError> = .success(ContactResponseModel())
    var getOneGotCalledWith = (UUID())
    func getOne(_ id: UUID) async -> Result<IContacts.ContactResponseModel?, IContacts.ContactError> {
        getOneGotCalledWith = (id)
        return getOneResult
    }
    var createResult: Result<Bool, ContactError> = .success(false)
    var createGotCalledWith = (ContactRequestModel())
    
    func create(_ contactRequestModel: IContacts.ContactRequestModel) async -> Result<Bool, IContacts.ContactError> {
        createGotCalledWith = contactRequestModel
        return createResult
    }
    var updateResult: Result<Bool, ContactError> = .success(false)
    var updateGotCalledWith = (UUID(), ContactRequestModel())
    func update(id: UUID, data: IContacts.ContactRequestModel) async -> Result<Bool, IContacts.ContactError> {
        updateGotCalledWith = (id, data)
        return updateResult
    }
    var deleteResult: Result<Bool, ContactError> = .success(false)
    var deleteGotCalledWith = (UUID())
    func delete(_ id: UUID) async -> Result<Bool, IContacts.ContactError> {
        deleteGotCalledWith = (id)
        return deleteResult
    }
    

    

}
