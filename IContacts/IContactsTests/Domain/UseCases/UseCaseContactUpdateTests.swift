//
//  UseCaseContactUpdateTests.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class UseCaseContactUpdateTests: XCTestCase {
    var useCase: UpdateContactUseCase!
    var mockContactRepository: MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    func test_return_success_on_repo_success() async {
        mockContactRepository.updateContactResult = .success(true)
        let expectedParams = (UUID(),ContactRequestModel(name: "Some name", number: "4545454"))
        let response = await useCase.execute(id: expectedParams.0, data: expectedParams.1)
        XCTAssertTrue(mockContactRepository.updateContactGotCalledWith == expectedParams)
        XCTAssertEqual(response, .success(true))
    }

}
