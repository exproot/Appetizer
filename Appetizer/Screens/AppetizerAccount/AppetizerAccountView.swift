//
//  AppetizerAccountView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerAccountView: View {

  @StateObject private var viewModel = AppetizerAccountViewModel()

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("First Name", text: $viewModel.firstName)
          TextField("Last Name", text: $viewModel.lastName)
          TextField("Email", text: $viewModel.email)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()

          DatePicker("Birthdate", selection: $viewModel.birthdate, displayedComponents: .date)

          Button {
            viewModel.saveChanges()
          } label: {
            Text("Save Changes")
          }
        } header: {
          Text("Personal Info")
        }

        Section {
          Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
          Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
        } header: {
          Text("Requests")
        }
//        .toggleStyle(SwitchToggleStyle(tint: Color.green))
      }
      .navigationTitle("Account")
    }
    .alert(item: $viewModel.alertItem, content: { alertItem in
      Alert(
        title: alertItem.title,
        message: alertItem.message,
        dismissButton: alertItem.dismissButton
      )
    })
  }
}

#Preview {
  AppetizerAccountView()
}
