//
//  IocContactainer.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
import Swinject
func buildContainer() -> Container {
    let container = Container()
    container.register(CoreDataWrapperProtocol.self) { _ in
        return CoreDataWrapper()
    }.inObjectScope(.container)
    
    container.register(ContactDataSourceProtocol.self) { _ in
        return CoreDataContactDataSource(dbWrapper: container.resolve(CoreDataWrapperProtocol.self)!)
    }.inObjectScope(.container)
    container.register(ContactRepositoryProtocol.self) { _ in
        return ContactRepository(contactDataSource : container.resolve(ContactDataSourceProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(CreateContactUseCaseProtocol.self) { _ in
        return CreateContactUseCase(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(DeleteContactUseCaseProtocol.self) { _ in
        return DeleteContactUseCase(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    container.register(UpdateContactUseCaseProtocol.self) { _ in
        return UpdateContactUseCase(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }
    container.register(GetContactUseCaseProtocol.self) { _ in
        return GetContactUseCase(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(GetAllContactUseCaseProtocol.self) { _ in
        return GetAllContactUseCase(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    return container
}
