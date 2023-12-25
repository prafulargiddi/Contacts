//
//  ContactListViewModelTest.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class ContactListViewModelTest: XCTestCase {

    var vm: ContactListViewModel!
    var getContacts :  MockGetAllContactUseCase!
    var deleteContact:  MockDeleteContactUseCase!
    
    
    override func setUp() {
        getContacts = MockGetAllContactUseCase()
        deleteContact = MockDeleteContactUseCase()
        vm = .init(
            getAllContacts: getContacts,
            deleteContact: deleteContact
        )
        
    }
    func test_deleteContact_should_return_success() async {
        deleteContact.executeResult = .success(true)
        let id = UUID()
        await vm.deleteContact(id)
        XCTAssertEqual(deleteContact.executeGotCalledWith, (id))
    }
    
    func test_deleteContact_set_error_when_deleteContact_fails() async{
        deleteContact.executeResult = (.failure(ContactError.Get))
        await vm.deleteContact(UUID())
        XCTAssertEqual(vm.errorMessage, "Error Deleting Contact")
    }
    
    func test_should_set_contacts_with_data() async{
        let expectedResult: [ContactResponseModel] = [
            ContactResponseModel(id: UUID(), name: "Paul", number: "22"),
            ContactResponseModel(id: UUID(), name: "John", number: "22")
        ]
        getContacts.executeResult = .success(expectedResult)
        await vm.getContacts()
        XCTAssertTrue(getContacts.executeGotCalled)
        XCTAssertEqual(vm.contacts, expectedResult)
    }
    
    
    func test_should_set_error_when_getContacts_fails() async{
        getContacts.executeResult = (.failure(ContactError.Get))
        await vm.getContacts()
        XCTAssertEqual(vm.contacts.count, 0)
        XCTAssertEqual(vm.errorMessage, "Error Fetching Contacts")
    }

}
