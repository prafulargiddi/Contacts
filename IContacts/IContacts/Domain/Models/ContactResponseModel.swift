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
    var number: String
    init() {
        self.id = UUID()
        self.name = ""
        self.number = ""
    }
    init(id: UUID, name: String, number: String){
        self.id = id
        self.name = name
        self.number = number
        
    }
}
struct ContactRequestModel: Equatable {
    
    var name: String
    var number: String
    init(){
    name = ""
    number = ""
    }
    
    init(name: String, number: String){
        self.name = name
        self.number = number
    }
    
}
