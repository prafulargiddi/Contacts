//
//  ContactRepositoryTests.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class ContactRepositoryTests: XCTestCase {
    var repo: ContactRepository!
    var contactDataSource: MockContactDataSource!
    override func setUp() {
        contactDataSource = MockContactDataSource()
        repo = .init(contactDataSource: contactDataSource)
    }
    func test_contactDataSource_getAll_should_be_called() async {
        let expectedResult = [ContactResponseModel(id: UUID(), name: "Some Name", number: "99883300")]
        contactDataSource.getAllResult = .success(expectedResult)
        let response = await repo.getContacts()
        XCTAssertTrue(contactDataSource.getAllGotCalled)
        XCTAssertEqual(response, .success(expectedResult))
    }
    
    func test_contactDataSource_getOne_should_be_called() async  {
        let expectedResult = ContactResponseModel(id: UUID(), name: "Some name", number: "9999292")
        contactDataSource.getOneResult = .success(expectedResult)
        let id = UUID()
        let response = await repo.getContact(id)
        XCTAssertTrue(contactDataSource.getOneGotCalledWith == (id))
        XCTAssertEqual(response, .success(expectedResult))
    }
   
    func test_contactDataSource_delete_should_be_called() async {
        contactDataSource.deleteResult = .success(true)
        let id = UUID()
        let response = await repo.deleteContact(id)
        XCTAssertTrue(contactDataSource.deleteGotCalledWith == (id))
        XCTAssertEqual(response, .success(true))
    }
    func test_contactDataSource_update_should_be_called() async {
        contactDataSource.updateResult = .success(true)
        let id = UUID()
        let response = await repo.updateContact(id: id, data: ContactRequestModel(name: "Some Name", number: "889393393"))
        XCTAssertTrue(contactDataSource.updateGotCalledWith == (id,ContactRequestModel(name: "Some Name", number: "889393393")))
        XCTAssertEqual(response, .success(true))
    }
    func test_contactDataSource_create_should_be_called() async {
        contactDataSource.createResult = .success(true)
        let response = await repo.createContact(ContactRequestModel(name: "some name", number: "989284234"))
        XCTAssertTrue(contactDataSource.createGotCalledWith == (ContactRequestModel(name: "some name", number: "989284234")))
        XCTAssertEqual(response, .success(true))
    }
}
