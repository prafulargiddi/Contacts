//
//  UseCasesContactCreateTests.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class UseCasesContactCreateTests: XCTestCase {
    var useCase: CreateContactUseCase!
    var mockContactRepository: MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    func test_repo_createContact_should_be_called() async {
        mockContactRepository.createContactResult = .success(true)
        let response = await useCase.execute(ContactRequestModel(name: "Some Name", number: "999999"))
        XCTAssertEqual(response, .success(true))
    }
}
