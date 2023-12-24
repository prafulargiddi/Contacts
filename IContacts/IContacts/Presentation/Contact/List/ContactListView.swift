//
//  ContactListView.swift
//  IContacts
//
//  Created by Praful Argiddi on 20/12/23.
//

import SwiftUI

struct ContactListView: View {
    @StateObject var viewModel = ContactListViewModel()
    fileprivate func onLoad() {
        Task{
            await viewModel.getContacts()
        }
    }
    
    fileprivate func renderListItem(_ contact: ContactResponseModel) -> some View {
        NavigationLink(destination: ContactEditView(contactId: contact.id)){
            HStack{
                VStack(alignment:.leading){
                    Text("\(contact.name)")
                        .font(.body)
                        .foregroundColor(.black)
                    
                }
            }
        }
        
    }
    
    fileprivate func onDelete(at offsets: IndexSet){
        let item = viewModel.contacts[offsets.min()!]
        Task{
            await viewModel.deleteContact(item.id)
            await viewModel.getContacts()
        }
    }
    
    fileprivate func renderList() -> some View{
        List{
            ForEach(viewModel.contacts, id:\.self){contact in
                renderListItem(contact)
            }.onDelete(perform: onDelete)
        }
        .onAppear(perform: onLoad )
        .navigationTitle("Contacts")
        .toolbar(content: { AddButton(destination: AnyView(ContactCreateView())) })
    }
    
    var body: some View {
        NavigationView{
            renderList()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContactListView()
}
