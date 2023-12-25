//
//  MockContactRepository.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import Foundation
class MockContactRepository: ContactRepositoryProtocol {
    var getContactsResult: Result<[ContactResponseModel], ContactError> = .success([])
    var getContactsGotCalled = false
    func getContacts() async -> Result<[IContacts.ContactResponseModel], IContacts.ContactError> {
        getContactsGotCalled = true
        return getContactsResult
    }
    var getContactResult: Result<ContactResponseModel?,ContactError> = .success(ContactResponseModel(id: UUID(), name: "Some Name", number: ""))
    var getContactGotCalledWith = (UUID())
    func getContact(_ id: UUID) async -> Result<IContacts.ContactResponseModel?, IContacts.ContactError> {
        getContactGotCalledWith = (id)
        return getContactResult
    }
    var deleteContactResult: Result<Bool,ContactError> = .success(false)
    var deleteContactGotCalledWith = (UUID())
    
    func deleteContact(_ id: UUID) async -> Result<Bool, IContacts.ContactError> {
        deleteContactGotCalledWith = (id)
        return deleteContactResult
    }
    var updateContactResult: Result<Bool,ContactError> = .success(false)
    var updateContactGotCalledWith = (UUID(), ContactRequestModel(name: "Some Name", number: "9434394"))
    func updateContact(id: UUID, data: IContacts.ContactRequestModel) async -> Result<Bool, IContacts.ContactError> {
        updateContactGotCalledWith = (id, data)
        return updateContactResult
        
    }
    var createContactResult: Result<Bool, ContactError> = .success(false)
    var createContactGotCalledWith = (ContactRequestModel(name: "Some Name", number: "9949494"))
    func createContact(_ contactRequestModel: IContacts.ContactRequestModel) async -> Result<Bool, IContacts.ContactError> {
        createContactGotCalledWith = contactRequestModel
        return createContactResult
    }
    
    
}
