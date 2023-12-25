//
//  UseCaseGetAllContactTests.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class UseCaseGetAllContactTests: XCTestCase {
    var useCase: GetAllContactUseCase!
    var mockContactRepository: MockContactRepository!
    override func setUp()  {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
    }
    
    func test_repo_getAllContact_should_be_called() async {
        let expectedResult = [ContactResponseModel(id: UUID(), name: "Paul", number: "44444")]
        mockContactRepository.getContactsResult = .success(expectedResult)
        let response = await useCase.execute()
        XCTAssertEqual(response, .success(expectedResult))
        XCTAssertTrue(mockContactRepository.getContactsGotCalled)
    }
}
