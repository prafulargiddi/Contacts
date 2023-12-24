//
//  CoreDataContactDataSource.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
class CoreDataContactDataSource: ContactDataSourceProtocol {
    let dbWrapper: CoreDataWrapperProtocol
    init(dbWrapper: CoreDataWrapperProtocol) {
        self.dbWrapper = dbWrapper
    }
    private func _getAll() throws -> [ContactEntity] {
        let result: [ContactEntity] = try dbWrapper.getData(entityName: "ContactEntity") as! [ContactEntity]
        return result
    }
    func mapToContactResponse(contactEntity: ContactEntity) -> ContactResponseModel {
        return ContactResponseModel(id: contactEntity.id!, name: contactEntity.name ?? "", number: contactEntity.phone ?? "")
    }
    func getAll() async -> Result<[ContactResponseModel], ContactError> {
        do{
            let data = try _getAll()
            return .success(data.map({ ContactEntity in
            mapToContactResponse(contactEntity: ContactEntity)}))
        } catch {
            return .failure(.Get)
        }
    }
    private func _getOne(id: UUID) throws -> ContactEntity {
        let result: [ContactEntity] = try dbWrapper.getData(entityName: "ContactEntity", predicate: NSPredicate(format: "id = %@", id.uuidString)) as! [ContactEntity]
        return result[0]
    }
    func getOne(_ id: UUID) async -> Result<ContactResponseModel?, ContactError> {
        do {
            let data = try _getOne(id:id)
            return .success(ContactResponseModel(id: data.id!, name: data.name ?? "", number: data.phone ?? ""))
        }catch {
            return .failure(.Get)
        }
    }
    
    func create(_ contactRequestModel: ContactRequestModel) async -> Result<Bool, ContactError> {
        do {
            let newContact = ContactEntity(context: dbWrapper.getContext())
            newContact.id = UUID()
            newContact.name = contactRequestModel.name
            newContact.phone = contactRequestModel.number
            try dbWrapper.saveEntity(entity: newContact)
            return .success(true)
        } catch {
            return .failure(.Create)
        }
    }
    
    func update(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError> {
        do {
           let oldData = try _getOne(id: id)
            oldData.name = data.name
            oldData.phone = data.number
            try dbWrapper.saveEntity(entity: oldData)
            return .success(true)
        } catch {
            return .failure(.Update)
        }
    }
    
    func delete(_ id: UUID) async -> Result<Bool, ContactError> {
        do {
           let data = try _getOne(id: id)
            try dbWrapper.deleteEntity(entity: data)
            return .success(true)
        } catch {
            return .failure(.Delete)
        }
    }
    
    
}
