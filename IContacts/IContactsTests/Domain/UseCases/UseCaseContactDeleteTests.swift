//
//  UseCaseContactDeleteTests.swift
//  IContactsTests
//
//  Created by Praful Argiddi on 25/12/23.
//
@testable import IContacts
import XCTest

final class UseCaseContactDeleteTests: XCTestCase {
    var useCase: DeleteContactUseCase!
    var mockContactRepository : MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    func test_repo_deleteContact_should_be_called() async {
        mockContactRepository.deleteContactResult = .success(true)
        let id = UUID()
        let response = await useCase.execute(id)
        XCTAssertEqual(mockContactRepository.deleteContactGotCalledWith, (id))
        XCTAssertEqual(response, .success(true))
        
    }
}
