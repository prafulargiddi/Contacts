//
//  ContactEntity+CoreDataProperties.swift
//  IContacts
//
//  Created by Praful Argiddi on 24/12/23.
//
//

import Foundation
import CoreData


extension ContactEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactEntity> {
        return NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}

extension ContactEntity : Identifiable {

}
