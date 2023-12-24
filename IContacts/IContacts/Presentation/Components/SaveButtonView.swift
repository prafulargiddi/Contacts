//
//  SaveButtonView.swift
//  IContacts
//
//  Created by Praful Argiddi on 20/12/23.
//

import SwiftUI

struct SaveButtonView: View {
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
    SaveButtonView(onSave: {}, isDisabled: false)
}
