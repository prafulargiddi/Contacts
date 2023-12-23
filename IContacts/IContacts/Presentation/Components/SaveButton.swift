//
//  SaveButton.swift
//  IContacts
//
//  Created by Praful Argiddi on 20/12/23.
//

import SwiftUI

struct SaveButton: View {
    var onSave: ()->Void
    var isDisabled: Bool
    var body: some View {
        Button(action: onSave){
            if isDisabled {
                Text("Save").foregroundStyle(.gray).font(.body)
            } else  {
                Text("Save").foregroundStyle(.blue).font(.body)
            }
        }
    }
}

#Preview {
    SaveButton(onSave: {}, isDisabled: false)
}
