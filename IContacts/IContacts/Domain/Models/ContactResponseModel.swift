//
//  ContactResponseModel.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
struct ContactResponseModel: Identifiable, Equatable, Hashable {
    let id: UUID
    var name: String
    
    init() {
        self.id = UUID()
        self.name = ""
    }
    init(id: UUID, name: String){
        self.id = id
        self.name = name
    }
}
struct ContactRequestModel: Equatable {
    var name: String
    
    init(){
    name = ""
    }
    
    init(name: String){
        self.name = name
    }
    
}
