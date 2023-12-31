//
//  ContacEditViewModelTest.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class ContacEditViewModelTest: XCTestCase {

    var vm: ContactEditViewModel!
    var mockUpdateContact : MockUpdateContactUseCase!
    var mockGetContact : MockGetOneContactUseCase!
    
    override func setUp() {
        mockUpdateContact = MockUpdateContactUseCase()
        mockGetContact = MockGetOneContactUseCase()
        vm = .init(
            updateContact: mockUpdateContact,
            getContact: mockGetContact
        )
        
    }
    
    func test_getContact_should_return_ContactResponseModel() async {
        let id = UUID()
        mockGetContact.executeResult = .success(ContactResponseModel(id: id, name: "Some Name", number: "323232"))
        await vm.getContact(id)
        XCTAssertTrue(mockGetContact.executeGotCalled)
        XCTAssertEqual(vm.name, "Some Name")
        XCTAssertEqual(vm.number, "323232")
        XCTAssertEqual(vm.isLoading, false)
        XCTAssertEqual(vm.errorMessage, "")
    }
    func test_getContact_should_return_failur_on_error() async {
        let id = UUID()
        mockGetContact.executeResult = .failure(.Get)
        await vm.getContact(id)
        XCTAssertTrue(mockGetContact.executeGotCalled)
        XCTAssertEqual(vm.name, "")
        XCTAssertEqual(vm.errorMessage, "Error Fetching Contact")
    }
    func test_canSave_should_be_true_new_and_original_values_are_diff(){
        vm.name = "Another Name"
        vm.number = "4343434"
        vm.originalContact = ContactResponseModel(id: UUID(), name: "Some Name", number: "4343434")
        XCTAssertTrue(vm.canSave)
    }
    
    func test_canSave_should_be_false_new_and_original_values_are_equal(){
        vm.name = "Some Name"
        vm.originalContact = ContactResponseModel(id: UUID(), name: "Some Name", number: "343434")
        XCTAssertFalse(vm.canSave)
    }
       
    
    func test_updateContact_should_return_called() async{
        mockUpdateContact.executeResult = .success(true)
        let id = UUID()
        vm.name = "Paul"
        vm.number = "4343"
        await vm.updateContact( id)
        XCTAssertTrue(mockUpdateContact.executeGotCalled)
        let expectedParams = (id, ContactRequestModel(name: "Paul", number: "4343"))
        XCTAssertTrue(mockUpdateContact.executeGotCalledWith == expectedParams)
    }
    
    func test_should_set_error_when_updateContact_fails() async{
        mockUpdateContact.executeResult = .failure(ContactError.Update)
        let id = UUID()
        await vm.updateContact(id)
        XCTAssertEqual(vm.errorMessage, "Error Updating Contact")
    }
    
}
