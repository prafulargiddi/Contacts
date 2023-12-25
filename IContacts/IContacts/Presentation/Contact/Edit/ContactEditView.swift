//
//  ContactEditView.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import SwiftUI

struct ContactEditView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var viewModel = ContactEditViewModel(updateContact: Resolver.shared.resolve(UpdateContactUseCaseProtocol.self), getContact: Resolver.shared.resolve(GetContactUseCaseProtocol.self))
    var contactId: UUID?
    fileprivate func onLoad() {
        Task{
            if(contactId != nil) {
                await viewModel.getContact(contactId!)
            }
        }
    }
    fileprivate func onSave() {
        Task {
            await viewModel.updateContact(contactId!)
            goBack()
        }
    }
    func goBack() {
        self.presentationMode.wrappedValue.dismiss()
    }
    fileprivate func buildForm() -> some View {
        Form {
            TextInputView(label: "Contact Name", value: $viewModel.name, isNumeric: .constant(false))
            TextInputView(label: "Phone", value: $viewModel.number, isNumeric: .constant(true))
        }.confirmationDialog("Are you sure you want to discard your changes?", isPresented: $viewModel.showAlert, titleVisibility: .visible) {
            Button("Discard Changes", role: .destructive, action: {goBack()})
            
            Button("Keep Editing", role:.cancel, action:{})
        }
    }
    var body: some View {
        buildForm()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButtonView(previousScreenTitle: "Contacts", canGoBack: !viewModel.canSave, goBack: goBack, showAlert: $viewModel.showAlert))
            .navigationTitle("Edit Contact")
            .toolbar(content: { SaveButtonView(onSave: onSave, isDisabled: !viewModel.canSave) })
            .onAppear(perform: onLoad )
    }
}

#Preview {
    ContactEditView()
}
