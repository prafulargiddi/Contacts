//
//  ContactCreateViewModelTest.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class ContactCreateViewModelTest: XCTestCase {
    var vm: ContactCreateViewModel!
    var mockCreateContact : MockCreateContactUseCase!
    
    override func setUp() {
        mockCreateContact = MockCreateContactUseCase()
        vm = .init(createContactUseCase: mockCreateContact)
        
    }
    func test_createContact_execute_should_be_called() async {
        mockCreateContact.executeResult = .success(true)
        vm.name = "Mock name"
        vm.number = "323423"
        await vm.createContact()
        XCTAssertTrue(mockCreateContact.executeGotCalled)
        XCTAssertEqual(mockCreateContact.exceuteGotCalledWith, ContactRequestModel(name: "Mock name", number: "323423"))
    }
    func test_should_set_error_when_createContact_fails() async {
        mockCreateContact.executeResult = .failure(ContactError.Create)
        vm.name = "Praful"
        await vm.createContact()
        XCTAssertEqual(vm.errorMessage, "Error Creating Contact")
    }
    
    func test_canSave_should_be_true_new_and_original_values_are_diff(){
        vm.name = "Another name"
        XCTAssertTrue(vm.canSave)
    }
    
    func test_canSave_should_be_false_new_and_original_values_are_diff(){
        vm.name = ""
        XCTAssertFalse(vm.canSave)
    }
    
}
