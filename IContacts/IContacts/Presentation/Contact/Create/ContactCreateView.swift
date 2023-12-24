//
//  ContactCreateView.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import SwiftUI

struct ContactCreateView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = ContactCreateViewModel()
    
    func goBack() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    fileprivate func onSave(){
        Task{
            await vm.createContact()
            goBack()
        }
    }
    
    fileprivate func buildForm() -> some View {
        Form{
            TextInputView(label: "Name", value: $vm.name, isNumeric: .constant(false))
            TextInputView(label: "Phone", value: $vm.number, isNumeric: .constant(true))
        }
        .confirmationDialog("Are you sure you want to discard your changes?", isPresented: $vm.showAlert, titleVisibility: .visible) {
            
            Button("Discard Changes", role: .destructive, action: {goBack()})
            
            Button("Keep Editing", role:.cancel, action:{})
        }
    }
    
    var body: some View {
        buildForm()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: BackButtonView(
                    previousScreenTitle: "Contacts",
                    canGoBack: !vm.canSave,
                    goBack: goBack,
                    showAlert: $vm.showAlert
                )
            )
            .navigationTitle("New Contact")
            .toolbar(content: { SaveButtonView(onSave: onSave, isDisabled: !vm.canSave) })
    }
}

#Preview {
    ContactCreateView()
}
