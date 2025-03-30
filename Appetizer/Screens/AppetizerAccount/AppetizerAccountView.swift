//
//  AppetizerAccountView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

enum FormTextField {
  case firstName, lastName, email
}

struct AppetizerAccountView: View {

  @StateObject private var viewModel = AppetizerAccountViewModel()
  @FocusState private var focusedTextField: FormTextField?

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("First Name", text: $viewModel.user.firstName)
            .focused($focusedTextField, equals: .firstName)
            .submitLabel(.next)
            .onSubmit {
              focusedTextField = .lastName
            }

          TextField("Last Name", text: $viewModel.user.lastName)
            .focused($focusedTextField, equals: .lastName)
            .submitLabel(.next)
            .onSubmit {
              focusedTextField = .email
            }

          TextField("Email", text: $viewModel.user.email)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .focused($focusedTextField, equals: .email)
            .submitLabel(.continue)
            .onSubmit {
              focusedTextField = nil
            }

          DatePicker(
            "Birthdate",
            selection: $viewModel.user.birthdate,
            in: Date.maximumAge()...Date.minimumAge(),
            displayedComponents: .date
          )

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
        .toggleStyle(SwitchToggleStyle(tint: Color.green))
      }
      .navigationTitle("Account")
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Button("Dismiss") {
            focusedTextField = nil
          }
        }
      }
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
