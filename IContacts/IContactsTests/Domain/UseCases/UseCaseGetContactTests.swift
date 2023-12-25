//
//  UseCaseGetContactTests.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class UseCaseGetContactTests: XCTestCase {
    var useCase: GetContactUseCase!
    var mockContactRepository: MockContactRepository!
    
    override func setUp()  {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
    }

    func test_repo_getContact_should_be_called() async {
        let expectedResult = ContactResponseModel(id: UUID(), name: "Some Name", number: "555555")
        mockContactRepository.getContactResult = .success(expectedResult)
        let response = await useCase.execute(expectedResult.id)
        XCTAssertEqual(response, .success(expectedResult))
        XCTAssertTrue(mockContactRepository.getContactGotCalledWith == (expectedResult.id))
        
    }
}
