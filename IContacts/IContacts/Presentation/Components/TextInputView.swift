//
//  TextInput.swift
//  IContacts
//
//  Created by Praful Argiddi on 20/12/23.
//

import SwiftUI

struct TextInputView: View {
    var label: String
    @Binding var value: String
    @Binding var isNumeric: Bool
    var body: some View {
        Section(header: Text(label)){
            TextField(label,text: $value).keyboardType(isNumeric ? .numberPad:.alphabet)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
    }
}

#Preview {
    TextInputView(label: "Name", value: .constant("Name"), isNumeric: .constant(false))
}
