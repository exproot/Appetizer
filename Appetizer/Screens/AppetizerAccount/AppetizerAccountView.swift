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
          TextField("First Name", text: $viewModel.user.firstName)
          TextField("Last Name", text: $viewModel.user.lastName)
          TextField("Email", text: $viewModel.user.email)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()

          DatePicker("Birthdate", selection: $viewModel.user.birthdate, displayedComponents: .date)

          Button {
            viewModel.saveChanges()
          } label: {
            Text("Save Changes")
          }
        } header: {
          Text("Personal Info")
        }

        Section {
          Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
          Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
        } header: {
          Text("Requests")
        }
//        .toggleStyle(SwitchToggleStyle(tint: Color.green))
      }
      .navigationTitle("Account")
    }
    .onAppear {
      viewModel.retrieveUser()
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
