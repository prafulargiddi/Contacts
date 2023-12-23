//
//  AddButton.swift
//  IContacts
//
//  Created by Praful Argiddi on 20/12/23.
//

import SwiftUI

struct AddButton: View {
    var destination: AnyView
        
    var body: some View {
        Button(action:{}){
            NavigationLink(destination: destination){
                Image(systemName: "plus")
                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
            }
        }
    }
}


//#Preview {
//    AddButton(destination: View())
//}
